/*
  Warnings:

  - Added the required column `fingerprint_validated` to the `keys` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "keys" ADD COLUMN     "fingerprint_validated" BOOLEAN NOT NULL;
