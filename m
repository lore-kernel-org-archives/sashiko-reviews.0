Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8737996B
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346915; cv=pass; b=Xsbh6sq5GnMVSZbzvvqa4RXbvUwnyrpLjYpGCHST82DXTgUuFrtd3JQOL7a1/gRYE0WIfZpMYWGgpo3iJpEo62NfvxUvm977j/eTDefnceFHELGkrjmwvKPPpwEoKX06icD2uZr8mC70QwIaoFa/ATkN4KTMQWF0/F2fW0FDUxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346915; c=relaxed/simple;
	bh=ANwWX/awSG4OoMeEHmBku3xc6bNHerEHyEoJpAywXKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5AmIUDMMbuLLiDoo9wS+s3jZxuy1XBC1GcsByd/jeH/mcjw553GO0L3Zxj8GALcX2+30KWxSwgEj3Q9ehAVZsn6o9+lQVPAo2wUbWwKZi5zhINhIBzub45MGlMai52HuA0/twlGfcy4xxVXs+DWCDoxFFPcPt8FZNBw4x+yIPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXabOkOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B01NMAuV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXabOkOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B01NMAuV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxX63175088
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 14:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=; b=VXabOkOaPUWLw7as
	0gTDE/OWPn8J6R6Z6nP/esOJc2az2bjzwO6S3yxPBoZEqQt+H937ZQzBfQyNRgf0
	CShBdG5/8PlHZq4zbstr6j10keeUEfjj18HlRzX+RG3gh/AXr0ifxHhfRdEIdejH
	Z0DMfa6wIIpPZw4pUxpoKi44xlRdyTptWR5/zucXWWIR5/7frlTMaCtjlUc9AQOh
	7GVO3scwWIujl7dy2dfWi7f6tHF84UpI1gWTV5aeEN/BlR0Ud6TfY22z4eBLgNd0
	B2nDqAJXGW4SFqSLFzkWn4H8wIWNZkPsi8Pt7WXETOttmU6dafG+aeTvSfdBGCVn
	ucitRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsnqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 14:08:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso558527285a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 07:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783346912; cv=none;
        d=google.com; s=arc-20260327;
        b=mnpJy53Wsml9NYJWnQcZKFFWwigutfUXe7dCbFws3SV4LK/a3tvVFQj5EhpdgQ6WpB
         9z5Jz/5o7kG7v8NJGlnpVYZjAEt+3rO0U3iu7/ThkvYyG5CSIwFlZoh1Ki2qPX7blU1H
         aoiMRW1g0xSOuw0bezu7xBQsbkB6HT3eJYGe6DwOmKmry9bs/YxmNXGOCeBQ3I2Pry9L
         AO55NH0ykMn2srUg+gio+N75MBwDGg1i1cdFiUg3GSuTm9re3kZF/JyJekfkua0odw4/
         zhLo8v1seiH/jP8WHH8kqzk94JRNoBWs6wbR1Qf7SphdpvHkg1pEIONQHoUa4QIf0QIu
         4gAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=VZz3eKfhyOQF8YH6J80vcMFq9UzDyH0e4eLA7fk0DkbmPBy6O47eYcSs8M9Ktd4Wlu
         KlRnxaQuBhwU1y0eIYaTZq5oZnUWqWB7bBufXb8QaxOPTEeUilF+nyDGQ2ZcrYuQQ8ij
         911kMwd9yszBDeQpaGq8NQqnAx8v5hjrz7kD4G8ykLy0m++SHIJwG9KHs6K2YRbN9DUA
         QRdD91MNBEy2wOApLlxtksurZTcS9SxXy9JWOAz4pS1jJGyJHHSanmAsiNQStDsMG6eJ
         Vt20aZAZ8mo+CKDFVxBv8yC4AIH/TXQQzr2groND6M+9WsFPeehp+6ozUjvX3plJmaWD
         Npow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346912; x=1783951712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        b=B01NMAuViQs+LVxj3rRXbb0CEy+MO0LMnOsTFoVIdTON4plefJZv/7AhYG0UsWK47J
         73ShWSkDGh/dc6o9YD15T2aCRdd1GKgFhbP5FrF2b3mo2sEy6ab0pLvrIJCwWzWcT7dG
         ZV7VRcRuiYmyz6/vX32dRdPil+HWyLMxe0/KnvGOuN+37RfwPeCasS0c3edWKbV8+VrU
         AcuQf04SLaE06O2wjOcFJ+uZaoYOnJ8ujt2k38o90fdhWcWlvJYc9ouADxkO28OJqSUT
         aapuLEYHQPCM7tiUnSlUSAKRvu/RAx0qTaRcq9UhMKrXPsnCIEFQJldy+sS6c4fha6xz
         tB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346912; x=1783951712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mz5L7xz1m+0nebaAnB8y/P0s4St8SiS01Tir9C+YcO8=;
        b=b7qPROspFhgFdmE00Gwsnqgpyz8X2S3WukFbpcaVlnKXKmxOADlGuMZj8zlcFjubDY
         NQNQNTtSwsWhe5dBsQcamppH0N+mAavCMzSq6kmrqU7vwImqaw9ds7gc5QVDZVOIiWCH
         tvNK134jZ1K06yGbI/OQ2nTv9IhZ+7Ttp7E/ThLQX76m+rlvks5Et07Q3Q88k1jGBIcC
         bLpYeQe9mZ1unL4QwKiJolY+AwOYCOgx/YS2F2bkisG6+5PqdbH4e4wJ40PAntpYW1lQ
         0BgQ7T18z+8g9OYtTFcOlagJcUSSoQm3bPwUuoJUhg0nqfjfe5jP6aMtDNAHWM95Gh4i
         16iA==
X-Gm-Message-State: AOJu0Yy6pqOBtXl4pwsPkStCRqgVqOIaYavLVaocD+Zcd/uIiecfWV3p
	QtNbVNaEUN+h/ZQgZy6mSwzQKlyypANgeA+olFkMcmRKZDi9fExkASFkGXLF6PkqctHW/1yv96I
	IViEja9lZBOljCYXD4O/dWDV7hpAbtovXz7KaZwPPTNOD/0KM01ctPdFtZV1MJj2gDcKHKkcpBB
	La5NRz5ehSC9DDdWt57IHnwQ86FfPzphm72Cl6wujEuCJ90gd6fa3N4kmr
X-Gm-Gg: AfdE7cmlqHfj5VW6IwuuOI0Z6qwGTgHUC3biAle4rY9fDLOUmzkETDtG5HnMygZg2uF
	uPM8QwiwK6sk8gyebNkSsRgVTripBrTk9TpHduItiLTMYe/Tp3OC5ljOI0ECrpkmKGRQawNTpXa
	0K/jqvjoodXks4+lZiUYOJnoGEmVk1zn4/oSGMIiz8vY3R5rx/rnRyukdyKPUQUfGG9XWi7WLtB
	LnXhX/lqTQ4D8iDGQciQuWCzTKiMgHWIsK4UDZ6sZcPjffUx1vlrTfcv6Kr0LE4ApMS4XBwfOdi
	yxWNZQ8ABjs=
X-Received: by 2002:a05:620a:1d0c:b0:92e:6b95:237a with SMTP id af79cd13be357-92ebb505f08mr99511685a.32.1783346911564;
        Mon, 06 Jul 2026 07:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:92e:6b95:237a with SMTP id
 af79cd13be357-92ebb505f08mr99506385a.32.1783346911118; Mon, 06 Jul 2026
 07:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com> <20260704134554.D6C411F00A3A@smtp.kernel.org>
In-Reply-To: <20260704134554.D6C411F00A3A@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 16:08:20 +0200
X-Gm-Features: AVVi8Cf4y-UzXQaofe6s9LCv8tELszbF5_LVcMZ06_qZWzpG2wpn6piYqqoSY1M
Message-ID: <CAFEp6-1mjx74Z12noBZOVu8mBk6+nbqMxxtZLYYqHvJ=qSaPNw@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jiSmQga5BR0mvWNYa9VkDjg9U7ggTK-V
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bb6e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=Rk-JEQ0JuZRAwbGkdHcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NCBTYWx0ZWRfX5fMLUtED3IoV
 xG5QqekV+YefWy254BMFkB69WJMlbKzYWBubkX9CNFCiU1XXrkpzOzM8is0XWkxMp6sgOYIZhBW
 Zk4CDlT6Sjt35uvwRyrW9B0Aghyn4sE=
X-Proofpoint-GUID: jiSmQga5BR0mvWNYa9VkDjg9U7ggTK-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NCBTYWx0ZWRfXz0TtPa6qwvrV
 sNYW1hrQu+Jf1LG2ah6o3PxA9iulyZV34mM9fqcN9GENKghg+j7ifZa6MRHav64FZvxc7ROl+u3
 tdTxkL3HAmbs2wJUF/FJjpP86ENeMY1O9eBbdaGKAtX6xY2qRmkBjXXoADTUmXXoo66GTZY/axG
 It2xNHi5j8mKWwhH+Q+udCF7W+0EC+TpT4btsXlcdSf08wr8kYywuJqwpTUYX0Gu8FUXkCf/1Rr
 TP+GLWyuJ1wVbCO+C1/ZcEc3x/1lGziK+LnbD28omHMlUVHmW43Zs0I4tzj987U5VWs9/n2sTpk
 rNYBUXMfsky7AmSEOzekvM3sqxrHnkDJjgB3rOnjTyWeDPpqzhIk0hpVaHQbR9OwyhvaQDGnMIy
 OzgepI9bpuIW0/Vp0liZEwNCMCno1zFNOaBmfkNgg+19OyT1FN8KSzzYSZaiEqS3yRtAA+1btGz
 rAWkmLdle66lPxQsrFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060144

On Sat, Jul 4, 2026 at 3:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The NVMEM provider incorrectly sets `config.owner =3D THIS_MODUL=
E`, failing to pin the underlying block device driver module and causing a =
Use-After-Free if the driver module is unloaded while a consumer holds an N=
VMEM cell.
> --
>
> commit 658c388a96462e54e252d777f2fc96dcf4f36d59
> Author: Daniel Golle <daniel@makrotopia.org>
>
> block: implement NVMEM provider
>
> This patch allows block devices or partitions to act as NVMEM providers,
> exposing factory-provisioned data such as MAC addresses or Wi-Fi calibrat=
ion
> blobs. It introduces blk_nvmem_add to register the block device with the
> NVMEM framework when the appropriate device tree nodes are present.
>
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000..642a12f8a8b1c
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
>
> [ ... ]
>
> > +int blk_nvmem_add(struct block_device *bdev)
> > +{
> > +     struct device *dev =3D &bdev->bd_device;
> > +     struct nvmem_config config =3D {};
> > +     struct nvmem_device *nvmem;
>
> [ ... ]
>
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
>
> [Severity: High]
> Should this owner be set to the block device driver's module, such as
> bdev->bd_disk->fops->owner, instead of THIS_MODULE?
>
> By setting config.owner to THIS_MODULE, it seems we pin the block core
> module but fail to protect the actual block device driver (like mmc_block=
)
> from being unloaded while a consumer still holds a reference to the NVMEM
> cell.
>
> If the driver module is unloaded, its module memory is freed. When the
> consumer later releases the cell and the bd_device refcount drops to zero=
,
> could disk_release() end up calling disk->fops->free_disk on a now-unmapp=
ed
> driver module pointer and cause a crash?
>
> > +     config.priv =3D (void *)(uintptr_t)dev->devt;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
>

The use-after-free you describe does not occur: this is already handled by =
the
Bartosz nvmem core rework [1], specifically "nvmem: protect nvmem_device::o=
ps
with SRCU". So when e.g. mmc_block is removed, nvmem is properly unregister=
ed,
and its ops are nullified. A consumer reading a cell afterwards gets -ENODE=
V,
not a crash.

[1] https://lore.kernel.org/all/20260629-nvmem-unbind-v5-0-233212f241c4@oss=
.qualcomm.com/
