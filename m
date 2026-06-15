Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5B3D25B4
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513174; cv=pass; b=SrinNW6yww8dOB1G9HcFmQNCKv9yuJsUCLgouocZ65UDMHkfTdKdrpAa59qSxl6F+ihzu5dVd4y+kc+vRk6cGHYuyRminbsI0x1M+TfUKQd40Y/fwJ0szYoQdzebbHqgNuABsEE4l/uvSyFl2xi5lJGYgpwVhwUsT0Jx6+P9jeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513174; c=relaxed/simple;
	bh=G+cF0IxDadI/1hGqsBf3e7nqm/g4Oiqdukiz1JknZIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6LZWAklyVEvjM8NFcBvNKytMBLbuQnrNl2I3sjC26zmfEmzPJPh+KOxPi0suKMId7j1A90JnDUmbGEYa2Aj4t75b8NOSAbfpr1j2SvEJjZUddskqRTu2Ag01dQYM0B2rHeYBrB5lnGYi3dSslriJLkyyqHGqdXyZc89LUT+3Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exaY9ntP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beBSQmAi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exaY9ntP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beBSQmAi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1xG3327540
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANXk5j5i2gDoO7wl8434YbaFQH6GiIPUxoXl2iGVH5U=; b=exaY9ntPlzFvLvPH
	3h+sTguxT2Ktoakt9Q4xLp/Q2FJkwG6/Ge/BzS75xQsOjrqX1gl29DkSWJ9TXiPC
	BqhO4iEkIgsWV3x4xTbnxFPXFMlM4fXR1L4uemU+TnXYVWPjI8cQq4pNYU/UxxL9
	nzc4RRhDHq+AwK4MsckuipPn/DHBRLaUJyO626GD1120DQ5wV1aPcNfPA70WzST3
	u7W30/7N97UZfLS7PBbQmBgF++moA/e2Clwe9ySq6d9NRvwWUZLBHHiWvac6B4Wr
	ycZx18ntXMZstp8bPr+b/3Cjag2Ngc8Aamy411uipxs5BEHEowI58kMlK3pwOrRv
	cDRxNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgpbfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:46:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158f07f5eeso516406585a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 01:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781513170; cv=none;
        d=google.com; s=arc-20240605;
        b=LbJrbNeJn8ajV8fzt6hZgkgWTpfwAI3WWHLxRaVCBgD6s10LhFWK2n0uzIJapTAd8z
         lePAIvKiKhcbbRjl5Ez73Qi66PII3PS26g4pOWsyvlid6AvPlU99LdfRA0tVHDEj2kLU
         EussZi4UYd/4Ps58Rn4nSIcPvUGn5NJo3vyg9sbAWpgL3Hm7cYAgbjuWWth77ZGHRz79
         rVzIk115zWXLnU6dJTMV5wa4I+18EnjrfqIFu0CZgXTlNXYYPu835nO1X7yEKLRa3j62
         anY9bunPlFh5jt8zim6p/qYKyNqx0W7nIuxSjUaQtySIfqPS5BlIuP+58MlTNxiubpMa
         llDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANXk5j5i2gDoO7wl8434YbaFQH6GiIPUxoXl2iGVH5U=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=HI7Ex8EEv1eap+cDLMhHKmasLtWWRABHpjMM7k42wRz1E26Sxc0CK35kZy4ZybtWs9
         FgL0unaUT/wkefADi+XhZCYZ/GxUS18nQYmr0f+Q1svgR6S4sowGbXkNmGDC4jyXdA0L
         mIcEPI3SqkPAm39gss8AfksuHWmeLaQPzc7QBzj+5jT9Kwu0PG+4uQeFDPgGXUqkaK+l
         kyVWG/9xpF6W0DkIw8rVC5LfvtuDNDCgPceGYSqCac3DO8I60FA7/N81JUjHHExJfZGz
         3O4PxqoK6az+EEtNM/XEN4oNcay0cjzWL0aWi+6ZjGao4CeDErErxS3HO0+ieQ0uNc79
         LDGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513170; x=1782117970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANXk5j5i2gDoO7wl8434YbaFQH6GiIPUxoXl2iGVH5U=;
        b=beBSQmAio0plwCdAznU6RbZ6pkMo2lmklKNJPfH8NJo8SMk5iF1xO8azRqxDq1W7PN
         2Xz8uZ/YH3Qk7VvodnU2oYGEvl5do7AprZz1Y5uXJrslkp74NphVxNMmsg4/kNQHkfW4
         j30qunGKvsaQ5+6MV/T0no4g2FHZ3Aa857rz/nzNuuypfcvHp1ZWbkcj73xA4BSiXrcr
         k2kSFFKpsONbjEWOQkDASX89aMQJZL3WNgcsEypKte0nbc+FsHfbucc5g/HAkfKBQ3s9
         4R5iW950SgCJW028Eh/0RD/o99c60WE5pSi5CLMupxM41tGBXfEblIhSQyBZjZKl8cka
         BXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513170; x=1782117970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANXk5j5i2gDoO7wl8434YbaFQH6GiIPUxoXl2iGVH5U=;
        b=jKcLg+LnhZOWKy+EqD+8J1+Lem7NVDIr9ugV1/JV4SaQrvvGdTREgZe3ty8WQlUwgt
         JH2FY74F7SUGNII4HJO5DsqsTXCfh9c3K4C7T/YrGRlgAIRrCJLCgPCiZDurzReXJfEd
         knqpYZdKgLcLPusK/LniEhUUYd6z/+hQdRmKg8G+iUmk0nvT7ooD4oyom2O4TlWe+UwC
         xUtbsFOqkJ2fLFV9CuRL+lmtCtBYAzMegEP+EP93+Mcikl6E9P9OziQMtTae3wGXR/r7
         gi13nScS6NzEAuV1kbjfgRzOCbRWhulIUDUAbwbHg558OfRg9ReGCVuohWSjHKN/Jwho
         rDUQ==
X-Gm-Message-State: AOJu0YzZYMMYd75No9fPIhUPuNq+aH3D4RxT+6+x7N31++5zkoqBewvY
	DsKlK3IXsQU/MPOUJHd9r4UkBLZ2svH2tLHAhLIo/u91qs0yJPoj2nyaaBZy4YCByUUNJHirWNh
	U1ipfjXGORkl+NJFA1NfynZ/RYXZ6zVwh+zVJCtxGNeFwnC1m+NPoxp4fOlzTM8UCdOotvxb7sy
	Tr1KJL3Fl/sH5Xfd6cVH6+Z557+nr46MrRxkXZZY/EjFVzH3FND84njwkS0lc=
X-Gm-Gg: Acq92OGKMm8pH3UAC45fUCVnWTaSQAOIpV1R4rAPopfRaThpXLFJ1Pkr9pyjKX6pGX+
	c6uIPOIRabQRLc24rP+yyPXifIq6E01qBTw93bC6FSMqA4oc7PEVvrqjRoQruOu81pzF+WwYubu
	S7PB3RYamjInws+FlEnMKpeRYUT0CX9C0IRa7xI0k0iN76ALRYwM+dvDmHMovjam1j2gZC8u1Py
	NnB/7wLLQBCYD6/uoKolFSWR6AuN+D5sdYwQ71kq6feTBQTQv584plhJBpdF2nNpMtaqTRkGFJc
	dv1tt3unUwE6yxDpo7WE
X-Received: by 2002:a05:620a:2b81:b0:915:9de3:2260 with SMTP id af79cd13be357-9161bc33be9mr1890951285a.24.1781513170427;
        Mon, 15 Jun 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:915:9de3:2260 with SMTP id
 af79cd13be357-9161bc33be9mr1890949085a.24.1781513169962; Mon, 15 Jun 2026
 01:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612-block-as-nvmem-v5-5-95e0b30fff90@oss.qualcomm.com> <20260613132137.D65B51F000E9@smtp.kernel.org>
In-Reply-To: <20260613132137.D65B51F000E9@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:45:58 +0200
X-Gm-Features: AVVi8CeDff4OXv7mqejTZ695MjPWmJonhJ73uNZONFk1NL8EWlRfGcjBTCzwzAA
Message-ID: <CAFEp6-2x7HFA1Yejzcr8DS9RAd5dVunKC2iKnt_rFyNDy=HeyA@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] block: implement NVMEM provider
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: U3p0jMXwiP47n4pywtOSrCeLOEhDBTz2
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fbbd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=VT4XjZGOAAAA:8 a=KVhDDZ7ALf19dExUH8oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: U3p0jMXwiP47n4pywtOSrCeLOEhDBTz2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX3XIEsW4YrOXv
 lnY9RXfPg5ARq6fr/u4rDycl7NblojsZg0fli/U465RgfY+FMt0mFt7KBU5mtgp8tZOwjIGPIaB
 TlMtSzSfEknVFRRF7ote15s4+5EzRqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX9hWMx96k+Z2d
 T/PCfy/49ThefSkvEc+ZsHbJ/uxktdBrhgF2xdonw6XKRvbTT6Y2umalb0IGSadpVg1VZ2u8pVR
 PNwtMiqiKd9Zaiy/m7mpf8laSWzzdQjd/AcVHTSvk3Ty9VesXvsmzwLMp1CRZjtLrSDxQnyiXLH
 pF6FdqRPfAvIpkWgoE0miZ/yCbMi3Aa1BPS4K0aQil/qcAlVAm11StTo5EmqfgtCdHktq1Fi1Sh
 CiqOilHqURVYpJSpBkq3fWML0J79uw0XuzQ4zG5FbbNgLW/QKHbOssDtcb4n8u1Qbvhy5TeOqFI
 lDjGDXeJl0l4HiU5O0Pj+EjAl8rVs1Ezn6ZoqAXqNjEYyOTm2tp797sQNhgJ/6y20/7VsZOtpFh
 VOcxbk83buxeroSHSVH/knHg6/fwLNi5XPr/hsoMgYOWf41R6qVYZC4R2LkjGth1sE3ZPd9Kd+L
 GutlQCJLHr/vGHNp8VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150091

On Sat, Jun 13, 2026 at 3:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] NVMEM provider opens the block device with exclusive write restr=
iction, causing conflicts on mounted systems.
> - [High] Hardcoded 4GB size limit incorrectly rejects modern eMMC devices=
.
> - [High] Integer overflow in size assignment exposes massive out-of-bound=
s size.
> - [High] Stale `dev_t` reference can cause data leaks across block device=
 hotplugs (ABA problem).
> - [High] Using `__free(fput)` defers block device claim release, creating=
 race conditions.
> --
>
> commit 459b659c960efdc8a9e2177c5bc4f832e7ee5730
> Author: Daniel Golle <daniel@makrotopia.org>
>
> block: implement NVMEM provider
>
> On embedded devices using an eMMC it is common that one or more partition=
s
> on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPROM
> data. Allow referencing the partition in device tree for the kernel and
> Wi-Fi drivers accessing it via the NVMEM layer.
>
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000..c005f059d9fe5
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> [ ... ]
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from, void *val=
, size_t bytes)
> > +{
> > +     blk_mode_t mode =3D BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES;
>
> [Severity: High]
> Since the NVMEM provider claims the whole disk (disk->part0), will openin=
g it
> with BLK_OPEN_RESTRICT_WRITES and an exclusive holder (priv) return -EBUS=
Y if
> any partition on the disk is already mounted or opened for writing?

It only blocks writes on part0, not on its logical partition block
devices. That said, I don=E2=80=99t see a strong reason to use
BLK_OPEN_RESTRICT_WRITES here.

>
> > +     dev_t devt =3D (dev_t)(uintptr_t)priv;
> > +     size_t bytes_left =3D bytes;
> > +     loff_t pos =3D from;
> > +     int ret =3D 0;
> > +
> > +     struct file *bdev_file __free(fput) =3D bdev_file_open_by_dev(dev=
t, mode, priv, NULL);
>
> [Severity: High]
> Does using __free(fput) defer the release of the block device claim? Beca=
use
> fput() schedules the file release asynchronously, could another subsystem
> trying to mount or claim the device immediately after an NVMEM read
> sporadically fail with -EBUSY?
>
> Should this use bdev_fput() instead to synchronously yield the claim befo=
re
> the rest of the file release?

Here, we're ok with the deferred file release.

>
> > +     if (IS_ERR(bdev_file))
> > +             return PTR_ERR(bdev_file);
> [ ... ]
> > +void blk_nvmem_add(struct block_device *bdev)
> > +{
> [ ... ]
> > +     /*
> > +      * skip block device too large to be represented as NVMEM devices=
,
> > +      * the NVMEM reg_read callback uses an unsigned int offset
> > +      */
> > +     if (bdev_nr_bytes(bdev) > UINT_MAX) {
>
> [Severity: High]
> Since the NVMEM provider is registered against the whole disk rather than=
 the
> individual NVMEM partition, does this 4GB limit incorrectly reject most m=
odern
> eMMC devices?

No, most of them have hardware partitions such as boot partition or
custom raw-user partitions separated from the main 'large' user area.

>
> > +             dev_warn(dev, "block device too large to be an NVMEM prov=
ider\n");
> > +             return;
> > +     }
> > +
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
>
> [Severity: High]
> Can storing the ephemeral dev_t identifier without holding a pinned block
> device reference cause an ABA problem?
>
> If the block device is removed, blk_nvmem_del() calls nvmem_unregister()
> which drops a reference but does not synchronously wait for consumers to
> close. If a new device is plugged in and reuses the same dev_t, could a
> consumer reading from the still-alive NVMEM device inadvertently access t=
he
> unrelated new block device?

Not, It's fixed in another Bartosz series.

>
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
>
> [Severity: High]
> Can this assignment cause an integer overflow?
>
> The config.size field in struct nvmem_config is a signed 32-bit int, so d=
isk
> sizes between 2GB and 4GB will overflow to a negative value. When
> nvmem_register() sign-extends this into its 64-bit size_t field, won't it
> result in a massive out-of-bounds size being exposed via sysfs?

Yes we need to change the above guard to INT_MAX.

>
> > +     config.word_size =3D 1;
> > +     config.stride =3D 1;
> > +     config.read_only =3D true;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-block-as=
-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com?part=3D5
