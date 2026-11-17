Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885343;
	b=pDzVc4V/sgZ0dzMPZjqZXJ0hsvDkuZGagoIpaSHrpbeMSCda618pG2eWrsIilDXnzR7/
	 lmVYrF77SdGuI0O0yuJem+N8si1r7Af+DHeIi26Ruw9c2CzAhT+wbPmvCUMo+truJ1eWv
	 ygPCiPEp4V/cpuPWTfUpvQ2UOyMf2cYraCid3E5ewjpPXOWihCaunl0o7H7AcVjRDMdx7
	 Q9rDt6m74h2Cip3Q3uc0Fz0y/BqF3Q3mAv8+vjJ0e537LLqd/40xqh3OHC4K90Qs1iFnw
	 g/GolefvdaJnSyFueJwiQRoU0Hps53iSX366/MzyEUcrgNWcznue7bnO8SqdGo1QrYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
	b=tM/7iLt+7YKSdjC1uAEl7U1vqomhdq4OSjbt8Di4Pjqxbp+1zibFeG6BzOVgnFFHX2Kg
	 hHzQ6V71b+N1yHwROJxj23/o5BrbG4tEsIG2sSXmCTh6+ep3Q814Zef/Og9yWyUiL2aZB
	 z9t/d+13b1nAjyl2ZhB66b+wCw79HmkNnlBMQGNsfY2G8miVMcSp4NJMGM41uXJq5jrc0
	 o7pT6FuPe1Fsn0Zz6bicrdNmYfsjStLJTjdwOOvgu5bK/0dBUjLwspjIrnmveBAZxM04H
	 18ujN5zdpjBn6ok/2EdT4/cXxT7hWZ2SKq2Nkjg5mXba4/BaIh3oG/1h1IUOoZOEfXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fy41sJZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i2Vdq/qw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE3606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBE3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fy41sJZh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2Vdq/qw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aC3m1507641
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=; b=Fy41sJZh0beN28KX
	xLcgYkVB2MgktBxRRx0+tY1tyDXgiXERzfJsEHKOCITg2F9EpENQ11Ix8nKpu0es
	knm8GjT2BQZExYwTvk6P/5E7r7kVoDG8c4GrwWPs10a5oiuJnGEIq2GiKsH2BOJw
	f3KI7pVRxIPOLgkwWufbhM3pBhgpd50v6+SuDVa+bTwcd6TtZjpJD4hQjkirGRsD
	p/sHDZPWWuB+VbxY9cEVJXrKx+mW2Md24g2sf+Ja5ZwYu3pGwuNZo0IaMomsuatk
	yE6SXi+k+eItLg2FGots+uX4wbF7z7h7C7P9L8xdPJVILSr6k+nDG0ZB952GZCQg
	Olov+A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gksq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:15:41 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6790b1d37e7so6495790d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 19:15:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885341; cv=none;
        d=google.com; s=arc-20260327;
        b=gDFzZJpeZoos8ouTNm3WWUpcyjiH+ck4zWxdXdIFWAVGhKTjN5oQ4UmBbsLOgOF1SN
         MukC/5xdIIATs7zjsWG5n5XcBnVkZyLBbkjiwh5j3z0jOmCVZer27KmvbsGQIaNNpvgl
         +J9KZwZ12/xUJqZ2rqqbe1jwwKKbcVxDH7IdMyWLeFku6e3o28SK3yitxC7UMx4eJiMP
         EYLdJrfNCnAdjemInM2Bvom2swsqJAKsdYGj1sJgJIVVxdM9R0MiCXJVd8GAGgz/+DxG
         qRiLAohmtldRkfUhoMexiCKzOC+aVCeG53DD4rf2X47PQXByhPYrr+LpBZWFzHzsk/9L
         2whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=Ei+iD1zCa21WS/RK7nh0PLnu6u6Wo4IhT09yGWcEQ1iIkvdvmMV54brFGsDU/JLaVU
         HElVUf+OAlm/y6i6zf0XKmNASoqa5la5NFgrx0TxEJC5G7jaDLJH/dGLqfbQa6gO1vYc
         xR4Pgr128U902PYtdW1JTknOGMSMnxYK/aFLDU28mFZWwzTcaxGKX3vrumHFtTZ0W16o
         0QvEkQc0Y/tNSUBzo4ChFWct4Yq3XGAex3cg0hMPpeSUiigz2rXD23UG3s+0sQKnDW9q
         1+ADA+X9b1wg6Ty/dtmwWe2jdXysl7DR/0PnTYaug46YUvwUFlGq+YIRrQpMGvrKcoQH
         hk5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794885341; x=1795490141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        b=i2Vdq/qwbIuY+C1zgv2bFiaX/suo8QWCJvRqWReDMdBrtSBRdWrvwLAL/OUuJ7JGJ2
         PJdM4sfTp+usFJT2G7PMXfUrn6UeEFmFUiOsOi2KYQy4MDEGf66nU0WuD218KuY8YZep
         jwqET/ctzX94XJyQX/cgiH8As0k+0dMW7EqX+gaQ57xW/UdGAJSqd/AufYzmfkhpzk9z
         PIVZ2MGXvzAG74DL4TJvWg/7ZqCvPRxe1NzBxvWZ7Fo0HCqoQz2ky0ZbJus57f6Rypka
         p1yidLeoz+vR/Zw0gRAFtbm/RswLCkb3pOFMF12U7T6kJ08QYHvLT5eLZNKH0z3kQib0
         Y/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885341; x=1795490141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RabYpJPA37+BmIYohz610z5qR1HM/X/uSXCq76koZdQ=;
        b=k4zAZl3EfVdV9IkjCpsCIwc7seybLvtTnQxV5JTsfaLFJ6nGUcJ4PhTxwOkCyl3NYe
         Q/u3vpfQ1SZvL6yEo8KM/6wjgRYEeOruZL9ne4cGAhbpZ2bVze/ufsI3mjjiBqwCOMy8
         oQFf5KehrkqQUccabTinpBp+zBK99JZIrJZTctgAizqK7zkcToLeU0G+SVYRRUbhw8QE
         o9yk8QJ1VPPzkdU72lUmCw4CSqqfS4c+tVmNd8IY/L/cvXghe2d2dwihIm0NEWpJlBCW
         ScHUwTo+aTIZjlxVEKiIg0PBHBx92eev1FQM6qrr+gz7YqobGdbh0FWwgjecaLUiNczu
         aMKg==
X-Gm-Message-State: APuU4Z8/PMg9GZNO+BzdC0+FWAVDmmBhbF7QVcE4AYSh7hV3HrdO/wnk
	+qaQRdxK13QfUC8RzI2OP/yJQe9qiHFqKQRz6k+EwrsL1g9bBHdST5jFaMxar4j8/GM2LWlDDAa
	G4rqQ/bgzy6tBOt5Cy0fRXmXLBMZgd6vitcN4ct/kNMtchSvTt8tSvYratdcp0RvI9fuBPQ02/4
	773J5gERs+I1pQgR5aWddz89pln4/QAtSgNFxAoS6QZbWb6PCSFpZ1ebsH
X-Gm-Gg: AZFdTZcxwv8cfLBmcyKQdH2svOAD39+519x9fKucgdMo0hmC2tfPZPo9TDCvCHBkXCr
	afHN3hIjRiXBretgX20SV+KtyJ3Du3Fjo3T9mRbd4euPN1G3O5WQ7esKP50WVxo8Z4gcJcMOsBb
	IlFyrS9JBC8GtD4299FteSO73haxEtDk11ajTc3DPTRaRcloukOHdro4iabg==
X-Received: by 2002:a05:690e:4181:b0:67b:ea15:ece8 with SMTP id 956f58d0204a3-67d89771ac9mr6846266d50.101.1794885341425;
        Mon, 16 Nov 2026 19:15:41 -0800 (PST)
X-Received: by 2002:a05:690e:4181:b0:67b:ea15:ece8 with SMTP id
 956f58d0204a3-67d89771ac9mr6846254d50.101.1794885340992; Mon, 16 Nov 2026
 19:15:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-1-96f4a0c08264@oss.qualcomm.com>
 <sashiko-outbox-216098@kernel.org>
In-Reply-To: <sashiko-outbox-216098@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:15:29 +0800
X-Gm-Features: AclHuK9x1svYbe_tchpY0HpLjvc9kttSRHHjY6uu8xpeTHuO5qWPVBBgBjndyqE
Message-ID: <CAPTcHHTwky0jGtG28TMCVRhV+VdXnnwyMn-Z0u+-Y2hujQdWSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfX+9DEyhZyq/Q6
 YhYvHBYQx6gHMtzF4hUYGu7k+C9C0w6wYQfleAOWWd+RU3JJ+/GGLd7GkpQFBvXiIowLcP7jy1O
 d8RGuU84hOHxdq0i4tmD1iUqIjAKZGtjnPkHIoAs54KUpWGfG1ZJBWNPVI70Fr4T4t7Nb3aGsLo
 ZI7J4QqLdO8E70W7zKJY8rTQYXoq80u6UuE6S7bgRJeaMU1TxjhwPf73YNa8f0Xfzge7EvVPAgn
 g8xhRusdHp1mR61xS1DH/cUWzuM15owLYZuAk+eGgPuGZ26ISFvyY0RtTooNYtcDuToI8dtZhKF
 CRlnvcFoDHA/gPE3DfaNyWY9UBTQF+6t/HhiPCxN/JTh/1Q0n2XfC/WCny2WRg2tgoIvFmq3LwI
 xnkPIRjzLdGOTCBRjPEAaOh1CtmvcsZgs2IIEU0Dw4S0opjo+QX9RMQJGEfjGSAIWFt688MOTo3
 oU+/SkRoNKM+dDksi3Q==
X-Proofpoint-GUID: Ys11U_jWLkC2jlHoKRK41QUNukDtGYw9
X-Proofpoint-ORIG-GUID: Ys11U_jWLkC2jlHoKRK41QUNukDtGYw9
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afbc6dd cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hCrUwOQTafd59ZRO5lEA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfX1Slk8ye8/al1
 jRXPxm32vh7adO8W3qWxnnJ+P4DHw/3QJ6cjkKyIrfZBnfJW6uMbUJgEJuuuANepK2uYh1yb5TM
 q5YRpzySwzv+I2Kt8U3VYpIe/HmOHTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170011

On Mon, Nov 16, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
>   beyond reg
> --
>
> commit 66779220f836f809e1148ff64ede0801ef303fad
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> dt-bindings: nvmem: add byte-mask property for non-contiguous byte select=
ion
>
> This commit adds the byte-mask property to the fixed-cell NVMEM binding t=
o
> select non-contiguous physical bytes within a 32-byte window relative to =
a
> cell's base offset.
>
> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..46e1101ee98ae 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,20 @@ properties:
> >          description:
> >            Size in bit within the address range specified by reg.
> >
> > +  byte-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    description: >
> > +      Bitmask selecting which physical bytes within the NVMEM device r=
egion
> > +      contribute to this cell's output. Bit N set means physical byte =
N
> > +      relative to the cell's base offset is included; selected bytes a=
re
> > +      packed into the output buffer in ascending byte order. Byte posi=
tions
> > +      are relative to the cell's base offset and limited to a 32-byte =
window.
> > +      The highest set bit must not reference a byte beyond the device =
size.
> > +      The number of set bits must not exceed the cell's logical size g=
iven by
> > +      reg. Cannot be used together with bits. Cells using byte-mask ar=
e
> > +      read-only; write operations are not supported.
>
> [Severity: Medium]
> Does byte-mask redefine the size cell of reg as a logical output size whi=
le
> allowing physical reads past the declared reg range?
>
> Any non-contiguous selection of K bytes has a highest set bit H >=3D K, w=
hich
> references physical bytes at offset + H outside a reg =3D <offset K> rang=
e.
> Unlike the existing bits property, which stays within the address range
> specified by reg, setting reg =3D <offset K> causes physical accesses bey=
ond
> the cell's declared reg range and hides overlaps between sibling cells.
> Conversely, setting reg =3D <offset M> to cover the full physical span M =
> K
> leaves the contents of the trailing M - K output bytes unspecified in the
> binding and causes consumers such as nvmem_get_mac_address() and
> nvmem_cell_read_u32() to see an unexpected cell size M instead of K.
>
> Also, the commit message notes that multiple reg entries would require th=
e
> consumer to assemble the value from separate cells, but multiple reg tupl=
es
> on a single cell node (for example, reg =3D <offset1 len1>, <offset2 len2=
>)
> describe one cell with discontiguous physical ranges without redefining r=
eg
> or limiting the span to 32 bytes.
>
The choice of reg =3D <offset K> where K =3D popcount(byte_mask) is
intentional: it exposes the logical output size directly in the
binding,
so that consumers such as nvmem_cell_read_u32() and
nvmem_get_mac_address() see the correct cell size without any
knowledge of byte-mask.

The physical read window (fls(byte_mask) bytes from offset) does
extend past the reg-declared range, and that is by design.
nvmem_validate_byte_mask() ensures the full physical window stays
within device bounds, so no out-of-device-bounds access occurs.
The overlap concern between sibling cells is real, but it is not new:
the existing framework does not enforce exclusivity between sibling
cell reg ranges in general;
DT authors are already responsible for the hardware layout. byte-mask
does not introduce a new enforcement gap.

Regarding multiple reg tuples: I will remove the "multiple reg
entries" statement from the commit message =E2=80=94 it was comparing
implementation approaches and was misleading since it conflated
multiple cell nodes with multiple reg tuples on a single node.

pw-bot: cr

Regards,
Hongmei Xu
