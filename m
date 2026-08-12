Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABE453A54
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547303; cv=none; b=QF65qMQAMSM3aFb/+TNC1fMYN797F9sUUvvuM/EOWWs7t+wvX0ofkB9pYdktPAXNBkkqL/gtywuDpp1IcG1XhvpIwSyO+l6UR7hwBPE1w/sKvlXtDUZbm91qHkLECE03em0OoVBl3h+t2mgm0gOr5pTv22cHQJnYAlhiE5e983Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547303; c=relaxed/simple;
	bh=/HZeIkKJEbfMYUyl4M++7+DHUMqUfxPEqVvYErFIO9k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z1EEaC7pys5K2re/9lmxqY7shJwhdA5K2Y6YLy5/0C7Rs+V+ZbGWOj3fo6T/POBrKmksb4eJqf9iHiSY9A8BJODzr/Zwn4cnyl5GJab5l9fSUx+kTn6MxyX1YD1AqR4yfsRQTmrOlCXop2slrAqyDuRT5nZIF7UP0Izv8NfGFUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2fyRxSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuFHCwW9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2fyRxSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuFHCwW9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbVdt899572
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=; b=a2fyRxSdqAcfJTia
	YC40ZY3P5/NshqG1npdGBFHD/w1FPBnG2LVykWmqDsBY3+8ePBPb4Fg2uGAPSitf
	UpUCE8xvXr+X2vxrZb6mP3VpidvQTBoguMNrlzJmABb8XwszO+QggkEA3QyhV2J5
	tSg8VYxdvw8GEb5ku+vCEirE+kGvlYhlbHqhDA0qhBSNYWoCBwouXQejpnPXGx+7
	3KXwEw9TO25DoKvs4eV3A+5K7vzvQlbiRyPViDXcxXnZdCPLSIY2ZOXXOz86OclT
	DD4keaUrA7SILJnsS9XFp6Xv8HvgyQIT6QZl0sI36TbIp/hcWdqJBddVTqfQD4x5
	lzzLQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut9grb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:08:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1294082a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786547300; x=1787152100; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=kuFHCwW9ymadV7hUcEMbpDdw8zgU+hL1VAAKZncbXe+HBxDBFcQTbAQnttbk+O9B0U
         7JY8qJoB8sTUUkoKit0NnHtPr6Mo8DnjTQWeAw7JhWXacSAESjCz5Fk2r7RnTP1pNBKx
         ruHUtCzWBR5OEMi3LJETHTzl+KzZF8HL8Es2nYw+bJZsK6J4tvb99PHutUg6nclb4oiI
         F7UslzZNDFxwgN1TLoZD755PkYT3Mk1/eNVEh8Ip0nnebwhbu85HTOeRjN8xUQpFL2YQ
         soAom7nqIB+hC3COykoxLMshFdMlZNvehTehgOv75z8+GA1w/J0fid4+t3SFvDBf7dTR
         Jrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547300; x=1787152100;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=iZmYR7hrk4obAhYsex5bPpyn7Wq79HeEoIvVYTpfKJdOagXJ/xxMVSDytgOG5sUgpO
         +sd3tB98EWwbBkwLgxKUnIZjPViC+zjEHU6pIrpkAM9/OnMbyp+ORRM/KpsvcghkLaYn
         uCAAfQElVXFRu0jJ+RpnzmyZKgnE5JjdfmscZ/C/b4Dm+3GWtihCvvwH8q3pAIkS3v7h
         evh0WeOYUeb6uDf19uQsKRlO+i7lYGJ+0zPnTrlrYtdxzpEdMrrpn/7Q5RjdaHO2Og3m
         hlDgvOgt6x5IhGEMPr01eTAxB75T4ZIa24JgvQgY9O4+9p/s5hXC3Mi68ELWAHXf4g+E
         K3gw==
X-Gm-Message-State: AOJu0Yw7SP4dZ81frgNO9Arv77TRg2oNAc5ucSMJiVmdOGUpobNYIIVZ
	NWBDj9/KTUnqoYG9haVAzJ4YmvGy3PRtXp5TWT7Hju59ybQTreBy9mIJ3X9Iud2Z0wWqbWQTCWn
	yzfu7/wWAIMz8Byes7+cQRavytqD/8iqQQNmnwumZu9nHQo3MbxIP1gp+Io2EqqDEiMKlmuJ65c
	a3wQwx+AEv
X-Gm-Gg: AR+sD11+D4nspK900zxPsTZLx5JST5gyHn3AQZmSwA+Shnfek7/q2IHLG+65G8C4jE/
	guysXbzkz0TA4sGoAnjGpQbOYB41NkbJj/JD4xlruHZxfCafUZKJ6zBADBrbgdLT3UEKZBrH1wL
	KKWUNwwRajP1Q90fjMyJmisFtA0JZZRTUvMicZ7P1hoJUE+NNO1jxg64GmmmvZn+JrBeuJcM3jz
	9HwSmKowfMR+rdnfVEa05WVdZX4TVictw0aLV7ZjlnXxOFy37rUPPq/sqi361can5uJBWDGRjEN
	uV+t05WcsIyJ99r3wkUGCS/qtbL7oTSSIk5bacLBGm7xZIcA512uvpfGWsQ=
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411176a91.19.1786547300502;
        Wed, 12 Aug 2026 08:08:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411072a91.19.1786547299966;
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94f24fdsm3850262a91.16.2026.08.12.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:08:14 -0400
Message-ID: <d2cefdc95214a7912df9e8298c010b9d.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
        conor+dt@kernel.org, linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v5 12/17] riscv: dts: spacemit: k1: Add Zic64b ISA extension
In-Reply-To: <20260701140057.EBFD91F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-12-2c61f94a695a@gmail.com>
 <20260701140057.EBFD91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfX8evTjzEc7rs5
 Z3xEqiGXz7UbtR1rR7ZAGxpi08sCfrcUQxUTIPCMlLd2oeZkniedzW82W3OVYZSiWbFZ/zc83+d
 zrhH4dypDYi4ilten0kqXPxrVL0uBUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfXzoJbb/UcmCTB
 Z4chbB2YfiV5HlXc8tpf2GtWeKhZO6v+/BLLY7pwwd4/72oi/5ZcrtqVA7xCn3JkUYx95kwYBU0
 A0hqRUQWMxOYDjACRMZ08zFtkJNg+5OIrfI6G5TDyy/YS8oD/8S3H/dJlAj7PfGfhK+xbOvyyWj
 oy/6W/CfBoohsSNW0WByKqWwkmHt+gWqUrpr8DKMNhAKgW+ipIgVkAkvgCgETaElU/4b7Lc6C0P
 o4S3OkLBoRDbObQaH+N9zY9FILtPzPvXPw8qkLy9e7KQ44ICDOFkIu/MleE+pkjLtCbLi0We9Z6
 /jU417+pb1h4cdXrvaJb29UyHthBqM/MAWmccG3U5kE6vA9mXNa09r8+dXFKBsymXqs5LdHEy3n
 i0cTTvE5qYok0sr536vxYpLdw0SF89XlR8Nd7Mxky9vNA8uGVTgSzvGp2J8ThhZ/sm8SNjzZSNi
 /LigLiPBeMHvprDDfZA==
X-Proofpoint-ORIG-GUID: ahC8-J--3MJaGK_wpe5veSflLEx-0_RA
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c8c65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=xdqrkOY86ttuWl1pWAoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ahC8-J--3MJaGK_wpe5veSflLEx-0_RA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120123

On Wed, 01 Jul 2026 14:00:57 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Adding a new ISA extension (`zic64b`) to the explicitly deprecated `riscv,isa` devicetree property.
> --
>
> commit a35d1f188ef1737f4ebf996e0483596e27176d0a
> Author: Guodong Xu <docular.xu@gmail.com>
>
> riscv: dts: spacemit: k1: Add Zic64b ISA extension
>
> This commit adds the Zic64b ISA extension to the K1 X60 cores. It updates
> both the riscv,isa-extensions list and the deprecated riscv,isa string
> across all CPU nodes in the device tree.
>
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 08a0f28d011fe..f179c619f5807 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -54,12 +54,12 @@ cpu_0: cpu@0 {
> >  			compatible = "spacemit,x60", "riscv";
> >  			device_type = "cpu";
> >  			reg = <0>;
> > -			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > +			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>
> [Severity: Low]
> This isn't a bug, but the riscv,isa devicetree property is officially
> deprecated in the devicetree bindings. Is it intentional to add the
> new zic64b extension to this legacy string?
>
> The accepted policy generally dictates that new extensions should only be
> added to the riscv,isa-extensions property.

Intentional. k1.dtsi carries both riscv,isa-extensions and the
legacy riscv,isa string in every CPU node, describing the same
hardware. As long as the file keeps both properties, they must list
the same set.

Inconsistency creates confusions to readers.

Guodong
