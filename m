Received: from va-2-53.ptr.blmpb.com (va-2-53.ptr.blmpb.com [209.127.231.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15B1DDA18
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558328; cv=none; b=j9y7PNsAC+JI81vbxGJr9kY5oooqJFkeW406YBCwlU6/HRcZGp2KksvXmYlUwR0ciQVm4iWe/HuWeukbriLAK3u452+uKNNk+RKlhAbLKJXtT560gGB1ufSUBJib0SFwuaiM/B2zpgfIF30SDy6A7I2U+tNE/oFHlZXj6eUz+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558328; c=relaxed/simple;
	bh=8sN/gASbE2UtPKXKz5J4QgZgJuO3ftn0phVSlHOl8Nc=;
	h=To:Cc:In-Reply-To:From:Date:Message-Id:Mime-Version:References:
	 Subject:Content-Type; b=I6yegzqfsG90JHWO+41aVaXthOmcMWu5qHhsroVxIQXzSpKHIQbkookpycG7guhbqRCuWeDioA8Tcp8b5OcUvyzel4AhQIZ1rR1qAwLoOwYbkNibb59DqyKunWcbmeq3CYYX2acUOPycMMYJnOSTMwZe02rD7iV7hLYKIANMIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=V7szyncS; arc=none smtp.client-ip=209.127.231.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="V7szyncS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1784558320;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=0uGC4WzXOhklcTOliQe6F0uluMokozPayluXadM4UA4=;
 b=V7szyncS4faQUPH8bz121PBdWND6NZyL/hjo/SCFh/blZmFFhBa/7AgPesakhB4Hx/cGt6
 z571NR3HH/Hpg8TChHOsyoMg8XpBHpc5MHJX2f5f8PanRId3XEjkpCl5A6u6HRVEgACAG8
 cHOwg5wDBW3ZHQ6pcIOUSZ4E5FxGnmh6xnFDTpWu5asfeQnB2uSZ5OZSgN2pZPMJ9XsV3d
 /552LOBTlbCT/BYERR0ujuu20kunqQ0seedODP2VOyRtJzPhtDQbIjNGfvdVtsoRgmd972
 39dSrWpzS5vGwC5lUM/40yP+LzGtzKNl1gOg2+xQQs56HPWX35zsdojf/QO53g==
To: <sashiko-reviews@lists.linux.dev>
Cc: <yukuai@fygo.io>, <linux-raid@vger.kernel.org>
In-Reply-To: <20260720113553.9353D1F000E9@smtp.kernel.org>
X-Lms-Return-Path: <lba+26a5e32ef+a42bd3+lists.linux.dev+colyli@fygo.io>
X-Original-From: Coly Li <colyli@fygo.io>
From: "Coly Li" <colyli@fygo.io>
Date: Mon, 20 Jul 2026 22:38:26 +0800
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Content-Transfer-Encoding: quoted-printable
Message-Id: <00B41B17-0B11-4999-8FA8-4E0B33E53B3C@fygo.io>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260720111400.2120834-1-colyli@fygo.io> <20260720113553.9353D1F000E9@smtp.kernel.org>
Subject: Re: [PATCH] md: do overflow check for sb->bblog_shift in super_1_load()
Content-Type: text/plain; charset=UTF-8
Received: from smtpclient.apple ([120.245.64.95]) by smtp.larksuite.com with ESMTPS; Mon, 20 Jul 2026 14:38:39 +0000

> 2026=E5=B9=B47=E6=9C=8820=E6=97=A5 19:35=EF=BC=8Csashiko-bot@kernel.org =
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The newly added bounds check for `sb->bblog_shift` incorrectly a=
llows values up to 63, failing to prevent 32-bit integer overflows and unde=
fined behavior which can lead to a divide-by-zero kernel panic.
> --
>=20
> --- Patch [1]: [PATCH] md: do overflow check for sb->bblog_shift in super=
_1_load() ---
> commit 36f9915dbd10f1c3803610b32e46390e9cb7ec7c
> Author: Coly Li <colyli@fygo.io>
>=20
> md: do overflow check for sb->bblog_shift in super_1_load()
>=20
> This commit adds a bounds check for sb->bblog_shift in super_1_load() to
> prevent possible overflows in the badblocks API. It limits the shift valu=
e
> to be less than BITS_PER_TYPE(sector_t).
>=20
>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>> index d1465bcd86c81..67f8edf4db368 100644
>> --- a/drivers/md/md.c
>> +++ b/drivers/md/md.c
>> @@ -1920,6 +1920,13 @@ static int super_1_load(struct md_rdev *rdev, str=
uct md_rdev *refdev, int minor_
>>  rdev->bb_page, REQ_OP_READ, true))
>> return -EIO;
>> bbp =3D (__le64 *)page_address(rdev->bb_page);
>> +
>> + /* check for badblocks api. */
>> + if (sb->bblog_shift >=3D BITS_PER_TYPE(sector_t)) {
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> [Severity: High]
> This is a pre-existing issue, but does this bounds check still allow valu=
es
> that can cause undefined behavior and integer overflows?
>=20
> Since BITS_PER_TYPE(sector_t) is 64, this allows sb->bblog_shift to be up
> to 63.
>=20
> However, count is declared as a 32-bit signed int in super_1_load(), so t=
he
> following operation:
>=20
>    count <<=3D sb->bblog_shift;
>=20
> will cause undefined behavior if the shift is >=3D 31.
>=20
> Additionally, downstream in block/badblocks.c (such as in badblocks_check=
()
> and _badblocks_set()), the shift is used with a 32-bit literal:
>=20
>    rounddown(s, 1 << bb->shift);
>=20
> If sb->bblog_shift is >=3D 32, this can result in undefined behavior and
> yield 0, leading to a divide-by-zero panic in the rounddown() macro durin=
g
> array IO.
>=20
> Should the maximum shift be restricted to a smaller value?


With an overflow check patch from Ramesh Adhikari <adhikari.resume@gmail.co=
m>,=20
only checking sb->bblog_shift >=3D BITS_PER_TYPE(sector_t) is enough. The r=
ested overflow
check will be performed inside badblocks API.

And if variables are overflowed before calling badblocks API, this is not t=
he badblocks API
issue, should not belong to the badblocks API check fixes.

Also I don=E2=80=99t feel it is necessary to do restricted overflow checkin=
g in super block loading stage,
if the invalid values are rejected, this super block will fail to load and =
won=E2=80=99t introduce any run time
problem.

Therefore, current checking with (sb->bblog_shift >=3D BITS_PER_TYPE(sector=
_t) is sufficient.


>=20
>> + pr_err("md: %pg: bogus bblog_shift %u for badblocks.\n",
>> + rdev->bdev, sb->bblog_shift);
>> + return -EINVAL;
>> + }
>> rdev->badblocks.shift =3D sb->bblog_shift;
>> for (i =3D 0 ; i < (sectors << (9-3)) ; i++, bbp++) {
>> u64 bb =3D le64_to_cpu(*bbp);
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720111400.21=
20834-1-colyli@fygo.io?part=3D1
