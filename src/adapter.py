"""Fhenix Fully Homomorphic Encryption (FHE) EVM Simulation."""
class EncryptedUint32:
    def __init__(self, raw_value: int, key: str = "fhe_master_key"):
        self.ciphertext = (raw_value ^ 0xDEADBEEF) & 0xFFFFFFFF
        self.key = key
    def decrypt(self, key: str) -> int:
        if key != self.key:
            raise PermissionError("Invalid FHE decryption key")
        return (self.ciphertext ^ 0xDEADBEEF) & 0xFFFFFFFF
