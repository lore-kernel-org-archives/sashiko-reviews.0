Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793482745;
	b=YwzCGD/F1b4bKkxbWDpCHm/2+48x+zztcwWFTJA+jxkB6AscKTgaxgFwYg0PHPRc1ISV
	 MsrtiwrxhyGsn8/VxmdlCFF4EJ0MAFexTk2WAnRvz9cU09gvbU3NG5U+d/r4BLqEYPntw
	 yp+2qROUHZa/aITjCsAscoe12pGT71gBvMlCfpm9X8JwgYfIzoVB1vAG1OuttIQ1O4IU+
	 W28I6DvaxH5MvKR88tP//oNKabj1i+Bcdcp7JtaOYg1PZNR7S5RO3thz3hqIBNHW+GnsQ
	 vKiQwK8+W7yfNAVrkdegFY8xVUQh+EJUdWJgpvv85m9Rf5h67vJ6VFJ2BKF0s0f6eeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793482745;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=aatEu+R4oBdwmoKSEBwu1Bsxl90H2OUPzCkzXJ7y7C4=;
	b=bJAU9/A1WR1aPPxMc1PGj646NqOL5TB4vkvrmv+vyTPjp4Q1G3zPdbuBZAMjv7O+ZfRa
	 YJqTNMeD4yXrGc+XRY3VpeTuzSbQRO3z2C9i/ngcTKZxu3S9MWH3I/J9rOg2dvEvAiO+x
	 dc9jsNfkW/N/3PTL6+1nkYPRR/Sgge9uQvsEpVOJsgyV85fMNGbY6xG3wdl0bRaxpKpAW
	 5J5Xl/ktlBsnQfDbOlzXhII+ao9ZPVgCeaQH2Z/keE1NL4BptQVhpNkGCRg+Y5HhBkbIG
	 M3BACdfXyMu/yxKy6Ngt4tXaTRE2ZVj5AoecR6jxB3tMN6nfih2CeUb78DJtpPn+sXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=m.kesenheimer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=E5fGw3Uw;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4317606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 21:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4317606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=m.kesenheimer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=E5fGw3Uw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793482735; x=1794087535; i=m.kesenheimer@gmx.net;
	bh=aatEu+R4oBdwmoKSEBwu1Bsxl90H2OUPzCkzXJ7y7C4=;
	h=X-UI-Sender-Class:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=E5fGw3UwABlFnPGI/NYzgbEu8iSMo0xv3hz+QEp7yxI49Z217VEzgsBbNMxYVd6A
	 lZq1hbf1gUDZUb5dvHdGO7b2SXCeN2jfufqTBMOKr2vAQRe3yRz+eyzvrdZHblQ+w
	 MLoa7MxFYk3JJrURs7aLPH1q0JLg3PlopU0HGYCIjo4uCGRix2GmtZmhyDHzgGMF/
	 IO2l3F9mvgVUkismTi+ufHfL3JlBTAS5K2XmhIPC39m3KM0qkC+nlDdMVDHIO7G2Y
	 skpHHnXuOEpE6Et5AKCxtjZIREi9mclgqngsRJSE3r/xzMt8pqNYUJEo5BtJWS3c6
	 8CURQcOY76s+ZYOMsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1xPBOW1rsh-00EYbQ; Sat, 31
 Oct 2026 22:38:55 +0100
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: [PATCH v3] drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
From: Matthias Kesenheimer <m.kesenheimer@gmx.net>
In-Reply-To: <sashiko-outbox-192131@kernel.org>
Date: Sat, 31 Oct 2026 22:38:39 +0100
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F53B8B6D-FEE0-4FDB-9C4B-A890F1AFCEF2@gmx.net>
References: <6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.net>
 <sashiko-outbox-191902@kernel.org>
 <2630FE08-2F46-4D29-AF3C-DD9EF2DE581E@gmx.net>
 <sashiko-outbox-192131@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-Provags-ID: V03:K1:Iyiet7irGgS/JWlMBOc/Wx/rC/YP7moex7R6+HnU0ruBBEmIJvv
 k4KoO7AGVes9cGgOo/DT3RpvQwMF6B2DCgN9YZx2uuP9G1fty0hv7Aomx76paSC2eK0Z27+
 6Us5RctRtvSxXoBJj/+6QdgJrekqxblv1jz1/wB7qGBX+h2INsqeh1mOg0CDyMlg2/VNjIu
 /GLnSzhCib1zFNCjp/mUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+3/XZp4k1hY=;SuX6opsPbraDnv3GA+yllbjmJRN
 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
 G7A=

When multiple cards share the same PCI device ID (e.g. RX 6600 and
RX 6600 XT both use 0x73ff), the VFCT table contains separate VBIOS
images for each card distinguished by their bus number.

The current implementation iterates VFCT entries and returns on the
first device-identity match, which may not have an exact bus match.
This causes cards to load the wrong VBIOS image (e.g. RX 6600 loading
RX 6600 XT's VBIOS), resulting in incorrect clock speeds and
potential system hangs.

Walk the VFCT table in a single pass, preferring an exact bus match.
amdgpu_acpi_vfct_match() returns 0 on an exact bus match, 1 on a
device-identity-only match, or -ENODEV on no match. The walk records
the matched entry - an exact bus match ends the walk immediately,
otherwise the first device-identity match is kept as a fallback. The
VBIOS is then loaded and validated once, after the walk, and the
bus-mismatch notice is emitted only when that fallback is actually
used.

Changes since v2:
- Load and validate the VBIOS once, after the walk, instead of
  duplicating the kmemdup()/check_atom_bios()/amdgpu_bios_release()
  sequence between the exact-match and fallback branches.
- Only emit the bus-mismatch notice when the device-identity fallback
  is actually used, avoiding a false notice on multi-GPU systems where
  an exact bus match exists.

Signed-off-by: Matthias Kesenheimer <m.kesenheimer@gmx.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 66 ++++++++++++++++--------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index f9315e0472fe..d69f8df87249 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct =
amdgpu_device *adev)
  * the bus numbers disagree we accept the entry if the device identity
  * matches.
  *
- * Returns: 0 on match, -ENODEV on no match
+ * Returns: 0 on exact bus match, 1 on device-identity match (bus
+ * mismatch), -ENODEV on no match
  */
 static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
 				  VFCT_IMAGE_HEADER *vhdr)
@@ -460,11 +461,7 @@ static int amdgpu_acpi_vfct_match(struct =
amdgpu_device *adev,
 		return 0;

 	/* Bus mismatch but device identity matches (PCI renumbering =
case) */
-	dev_notice(adev->dev,
-		   "VFCT bus number mismatch: table %u !=3D runtime %u, =
matching by device identity (vendor 0x%04x device 0x%04x)\n",
-		   vhdr->PCIBus, adev->pdev->bus->number,
-		   adev->pdev->vendor, adev->pdev->device);
-	return 0;
+	return 1;
 }

 static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
@@ -474,6 +471,7 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
 	UEFI_ACPI_VFCT *vfct;
 	unsigned int offset;
 	bool r =3D false;
+	GOP_VBIOS_CONTENT *vbios =3D NULL;

 	if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
 		return false;
@@ -487,8 +485,9 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
 	offset =3D vfct->VBIOSImageOffset;

 	while (offset < tbl_size) {
-		GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
-		VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
+		GOP_VBIOS_CONTENT *entry =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
+		VFCT_IMAGE_HEADER *vhdr =3D &entry->VbiosHeader;
+		int match;

 		offset +=3D sizeof(VFCT_IMAGE_HEADER);
 		if (offset > tbl_size) {
@@ -502,23 +501,46 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
 			goto out;
 		}

-		if (vhdr->ImageLength &&
-		    !amdgpu_acpi_vfct_match(adev, vhdr)) {
-			adev->bios =3D kmemdup(&vbios->VbiosContent,
-					     vhdr->ImageLength,
-					     GFP_KERNEL);
-
-			if (!check_atom_bios(adev, vhdr->ImageLength)) {
-				amdgpu_bios_release(adev);
-				goto out;
-			}
-			adev->bios_size =3D vhdr->ImageLength;
-			r =3D true;
-			goto out;
+		if (!vhdr->ImageLength)
+			continue;
+
+		match =3D amdgpu_acpi_vfct_match(adev, vhdr);
+		if (match < 0)
+			continue;
+
+		if (match =3D=3D 0) {
+			/* Exact bus match wins - use it and stop =
scanning */
+			vbios =3D entry;
+			break;
 		}
+
+		/* match =3D=3D 1: record the first device-identity =
match as a fallback */
+		if (!vbios)
+			vbios =3D entry;
 	}

-	dev_info(adev->dev, "ACPI VFCT table present but broken (too =
short #2),skipping\n");
+	/* Load and validate the matched VBIOS once */
+	if (vbios) {
+		VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
+
+		if (vhdr->PCIBus !=3D adev->pdev->bus->number)
+			dev_notice(adev->dev,
+				   "VFCT bus number mismatch: table %u =
!=3D runtime %u, matching by device identity (vendor 0x%04x device =
0x%04x)\n",
+				   vhdr->PCIBus, =
adev->pdev->bus->number,
+				   adev->pdev->vendor, =
adev->pdev->device);
+		adev->bios =3D kmemdup(&vbios->VbiosContent,
+				     vhdr->ImageLength,
+				     GFP_KERNEL);
+
+		if (!check_atom_bios(adev, vhdr->ImageLength)) {
+			amdgpu_bios_release(adev);
+			goto out;
+		}
+		adev->bios_size =3D vhdr->ImageLength;
+		r =3D true;
+	} else {
+		dev_info(adev->dev, "ACPI VFCT table present but broken =
(too short #2),skipping\n");
+	}

 out:
 	acpi_put_table(hdr);
--
2.56.0

> On 31. Oct 2026, at 21:51, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> - [Medium] drm/amdgpu: changelog and Signed-off-by placed below --- =
separator
> - [Low] drm/amdgpu: false bus-mismatch notice in =
amdgpu_acpi_vfct_match()
> - [Low] drm/amdgpu: duplicated VBIOS load logic in =
amdgpu_acpi_vfct_bios()
> --
>=20
> commit 02e5f189d060ccb33fa88a19690736b51eba300f
> Author: Matthias Kesenheimer <m.kesenheimer@gmx.net>
>=20
> drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
>=20
> This commit modifies amdgpu_acpi_vfct_bios() and =
amdgpu_acpi_vfct_match()
> to walk the ACPI VFCT table in a single pass, preferring an exact PCI =
bus
> number match and falling back to the first device-identity match only =
if no
> exact bus match is found.
>=20
>>    drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
>>=20
>>    Thanks for the review. Addressing both points:
>>     - The unused fallback_vbios/fallback_vhdr are now actually used: =
the first device-identity match is recorded during the pass and loaded =
only if no exact bus match is found.
>>    - Collapsed the two passes into a single table walk, keeping all =
matching logic in amdgpu_acpi_vfct_match() (returns 0 exact-bus / 1 =
identity-only / -ENODEV none). Matching behavior is unchanged from v1.
>>=20
>>    The patch works on a live system.
>=20
> [Severity: Medium]
> It looks like the v2 review reply was placed above the --- separator, =
while
> the actual commit description and Signed-off-by tag were placed below =
it.
> When applied via git am, everything below --- is stripped, leaving the
> commit without its changelog explanation or Signed-off-by tag. Could =
the
> commit description and Signed-off-by be moved above the --- line, with =
the
> v2 changelog notes below it?
>=20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> index f9315e0472fe9..ef9fd98eb9e1a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> @@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct =
amdgpu_device *adev)
>>  * the bus numbers disagree we accept the entry if the device =
identity
>>  * matches.
>>  *
>> - * Returns: 0 on match, -ENODEV on no match
>> + * Returns: 0 on exact bus match, 1 on device-identity match (bus
>> + * mismatch), -ENODEV on no match
>>  */
>> static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
>>  VFCT_IMAGE_HEADER *vhdr)
>> @@ -464,7 +465,7 @@ static int amdgpu_acpi_vfct_match(struct =
amdgpu_device *adev,
>>   "VFCT bus number mismatch: table %u !=3D runtime %u, matching by =
device identity (vendor 0x%04x device 0x%04x)\n",
>>   vhdr->PCIBus, adev->pdev->bus->number,
>>   adev->pdev->vendor, adev->pdev->device);
>> - return 0;
>> + return 1;
>> }
>=20
> [Severity: Low]
> Will amdgpu_acpi_vfct_match() log a false bus-mismatch notice when =
probing
> the second GPU on a system with multiple identical PCI device IDs?
>=20
> When amdgpu_acpi_vfct_bios() walks the VFCT table for the second card,
> amdgpu_acpi_vfct_match() first encounters the entry for the first card =
on a
> different bus and immediately prints:
>=20
>    dev_notice(adev->dev,
>               "VFCT bus number mismatch: table %u !=3D runtime %u, =
matching by device identity (vendor 0x%04x device 0x%04x)\n",
>               ...);
>=20
> before returning 1, even though a subsequent VFCT entry matches the =
second
> card's bus number exactly and is used instead.
>=20
> Would it be better to move this dev_notice() out of =
amdgpu_acpi_vfct_match()
> and emit it in amdgpu_acpi_vfct_bios() only when the fallback entry is
> actually selected after the loop?
>=20
>>=20
>> static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
>> @@ -474,6 +475,8 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
>> UEFI_ACPI_VFCT *vfct;
>> unsigned int offset;
>> bool r =3D false;
>> + GOP_VBIOS_CONTENT *fallback_vbios =3D NULL;
>> + VFCT_IMAGE_HEADER *fallback_vhdr =3D NULL;
>>=20
>> if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
>> return false;
>> @@ -489,6 +492,7 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
>> while (offset < tbl_size) {
>> GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char *)hdr + =
offset);
>> VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
>> + int match;
>>=20
>> offset +=3D sizeof(VFCT_IMAGE_HEADER);
>> if (offset > tbl_size) {
>> @@ -502,8 +506,15 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
>> goto out;
>> }
>>=20
>> - if (vhdr->ImageLength &&
>> -    !amdgpu_acpi_vfct_match(adev, vhdr)) {
>> + if (!vhdr->ImageLength)
>> + continue;
>> +
>> + match =3D amdgpu_acpi_vfct_match(adev, vhdr);
>> + if (match < 0)
>> + continue;
>> +
>> + /* Exact bus match - use immediately */
>> + if (match =3D=3D 0) {
>> adev->bios =3D kmemdup(&vbios->VbiosContent,
>>     vhdr->ImageLength,
>>     GFP_KERNEL);
>> @@ -516,9 +527,29 @@ static bool amdgpu_acpi_vfct_bios(struct =
amdgpu_device *adev)
>> r =3D true;
>> goto out;
>> }
>> +
>> + /* Device-identity match (bus mismatch) - record as fallback */
>> + if (!fallback_vbios) {
>> + fallback_vbios =3D vbios;
>> + fallback_vhdr =3D vhdr;
>> + }
>> }
>>=20
>> - dev_info(adev->dev, "ACPI VFCT table present but broken (too short =
#2),skipping\n");
>> + /* No exact bus match - use the first device-identity match */
>> + if (fallback_vbios) {
>> + adev->bios =3D kmemdup(&fallback_vbios->VbiosContent,
>> +     fallback_vhdr->ImageLength,
>> +     GFP_KERNEL);
>> +
>> + if (!check_atom_bios(adev, fallback_vhdr->ImageLength)) {
>> + amdgpu_bios_release(adev);
>> + goto out;
>> + }
>> + adev->bios_size =3D fallback_vhdr->ImageLength;
>> + r =3D true;
>> + } else {
>> + dev_info(adev->dev, "ACPI VFCT table present but broken (too short =
#2),skipping\n");
>> + }
>=20
> [Severity: Low]
> As reported by Sashiko on v1 [1], this isn't a bug, but the kmemdup(),
> check_atom_bios(), and amdgpu_bios_release() sequence in
> amdgpu_acpi_vfct_bios() is still duplicated between the exact-match =
branch
> inside the loop and the fallback_vbios branch after the loop.
>=20
> Since vhdr is &vbios->VbiosHeader, could the loop simply record the =
matched
> GOP_VBIOS_CONTENT pointer (breaking immediately when match =3D=3D 0) =
and run the
> allocation and validation once after the loop?
>=20
> [1] =
https://lore.kernel.org/r/6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.net
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/2630FE08-2F46-4D29-AF3C-DD9EF2DE581E@gmx.ne=
t?part=3D1

