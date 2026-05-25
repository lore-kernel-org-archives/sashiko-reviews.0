Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF74219992C
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686766; cv=pass; b=LOsnkeXTD5n1F9p1R2BgD/A8FkrWXUqByXk/ETX28PS4BRSIe4wzTsg6J/B3NGlwONYB2D6+zKy6tbOiYP1SJTotzPv44eYX0huEaJcIB3xPXav16UOxCKVoO5e0ctnvahiDGI/zNZ6o1L32F87JAWrOBjmny956ouhdwegD9ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686766; c=relaxed/simple;
	bh=yR68xaD4R1qEP77CR6tAT3cjzzNR5feCDfa7tJ5rD/U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ce6zVvYjYVzpG59A//+yOi84aU2BLg3SmGWCq8+gQIIUPYU/SxzEgSl7xoPA12JkwpfJ0tySmxiyr158Xsp/t/FfXqBsA1MI+yk4GWDtlJYqGd1lhtGcejw6AkgG5c3MxTTRpPfksh9KiQRXvnwa4Bt8XbK1GlbKajXLndGXb/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=Kh+2wWFo; arc=pass smtp.client-ip=103.117.158.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="Kh+2wWFo"
ARC-Seal: i=1; a=rsa-sha256; t=1779686759; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=OcmQyl12GAXA8omj8XuHMi0UQEkv7klLX8KrROll4c3h4FYyGrNuCy6ZriBPqEyl15Jfl6WOJViS0HsqiH6lsFDuPk03d4Dvws8+fQYrDw3hwcZgVsdJ4hgkhR5R6am/gjZ9KGMG+tDi+4bJROW2FNlnytQclFZJXk21j+XUCII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779686759; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pnpOZffCRtxdSobaLK908rgAg4Hr78/cAjduiZWFy70=; 
	b=Umyk3x/SZ8PAZolRfuIvi13n1UsaR81RVKogGQsTJMo+zLQXhQduN0BEs82pRxILExQM2OtTqBpMYCO3tS9V5Wmox92RiRv06Ayrp2aHQqkbBlcY/ozobREg58nkOqqDJ8Lf7o1TGfs5W+jPSH8ZmmhyCkedMkjsq3GTWtLZeyw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779686759;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pnpOZffCRtxdSobaLK908rgAg4Hr78/cAjduiZWFy70=;
	b=Kh+2wWFoqbVuXq6+wNfGmSOQCDvOeqmTaJRIXjfHd9AnNOtpGguRNp0SAcOVru0y
	4YpMwRF70JQ8ehietyPiyitA7zzLkLFRD9Zd3tO0U8S9b4wYGGRBw/bA+vMQOcAplXh
	X9WGYvOvT3QGTjFWDPZrKNoEmdpqmfhRzWvcwpGw=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779686752808367.8177718722824; Mon, 25 May 2026 10:55:52 +0530 (IST)
Received: from  [106.192.20.149] by mail.zoho.in
	with HTTP;Mon, 25 May 2026 10:55:52 +0530 (IST)
Date: Mon, 25 May 2026 10:55:52 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "sashiko-reviews" <sashiko-reviews@lists.linux.dev>
Cc: "tytso" <tytso@mit.edu>
Message-ID: <19e5d98c220.1087e34d63772.3217846254094913053@zohomail.in>
In-Reply-To: <20260524155518.DE2BA1F000E9@smtp.kernel.org>
References: <19e5aa07c9b.3a2e576d130187.5289857983023045470@zohomail.in> <20260524155518.DE2BA1F000E9@smtp.kernel.org>
Subject: Re: [PATCH v4] ext2: Remove deprecated DAX support
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

The remaining IOMAP_F_DIRTY issue is pre-existing and was present in the
code before this patch. It is outside the scope of this DAX removal.

This v4 patch only removes deprecated DAX code and does not introduce
any new issues. The pre-existing IOMAP_F_DIRTY flag overwrite can be
addressed in a separate patch.

Thanks,
Ashwin


From:  <sashiko-bot@kernel.org>
To: "Ashwin Gundarapu"<linuxuser509@zohomail.in>
Cc: <tytso@mit.edu>
Date: Sun, 24 May 2026 21:25:18 +0530
Subject: Re: [PATCH v4] ext2: Remove deprecated DAX support

 > Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:=20
 > =20
 > Pre-existing issues:=20
 > - [High] The IOMAP_F_DIRTY flag is overwritten and lost in ext2_iomap_be=
gin.=20
 > --=20
 > =20
 > commit 8c79c2b11b7034bbd0ac9adde5c15bf2fea9def8=20
 > Author: Ashwin Gundarapu <linuxuser509@zohomail.in>=20
 > =20
 > ext2: Remove deprecated DAX support=20
 > =20
 > This commit removes all DAX code from ext2, following the deprecation=20
 > deadline at the end of 2025. It strips out the DAX mount option, IOMAP=
=20
 > DAX support, and DAX-specific file and address_space operations.=20
 > =20
 > > diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c=20
 > > index 74aca5eb572d9..e2aa6152fa1f0 100644=20
 > > --- a/fs/ext2/inode.c=20
 > > +++ b/fs/ext2/inode.c=20
 > [ ... ]=20
 > > @@ -841,10 +818,7 @@ static int ext2_iomap_begin(struct inode *inode, =
loff_t offset, loff_t length,=20
 > >=20
 > >      iomap->flags =3D 0;=20
 > =20
 > [Severity: High]=20
 > This is a pre-existing issue, but does this line overwrite the IOMAP_F_D=
IRTY=20
 > flag set earlier in this function?=20
 > =20
 > Looking at the code just above this hunk, the flag is set for extending=
=20
 > writes:=20
 > =20
 >     if ((flags & IOMAP_WRITE) && offset + length > i_size_read(inode))=
=20
 >         iomap->flags |=3D IOMAP_F_DIRTY;=20
 > =20
 > But then it is unconditionally cleared here by iomap->flags =3D 0.=20
 > =20
 > The iomap direct I/O infrastructure relies on this flag to trigger O_DSY=
NC=20
 > metadata syncs upon I/O completion.=20
 > =20
 > Does losing this flag mean that extending O_DSYNC direct I/O writes migh=
t=20
 > not correctly sync the updated file size to disk, potentially leading to=
=20
 > a stale file size if a crash occurs?=20
 > =20
 > >      iomap->offset =3D (u64)first_block << blkbits;=20
 > > -    if (flags & IOMAP_DAX)=20
 > > -        iomap->dax_dev =3D sbi->s_daxdev;=20
 > > -    else=20
 > > -        iomap->bdev =3D inode->i_sb->s_bdev;=20
 > > +    iomap->bdev =3D inode->i_sb->s_bdev;=20
 > >=20
 > >      if (ret =3D=3D 0) {=20
 > >          /*=20
 > [ ... ]=20
 > =20
 > --=20
 > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/19e5aa07c9b.3a2e=
576d130187.5289857983023045470@zohomail.in?part=3D1=20
 >=20

