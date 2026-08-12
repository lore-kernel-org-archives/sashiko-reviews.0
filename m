Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7745C6E1
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547760; cv=none; b=Qymsh0z18zMhKU5OLyA+Wyao5RRqR2rDrsnPtsKGw9Ijuf/joObaMirU8T89XI8dQBc5R8tGfZDlplKwLIpbHH/3VKIU4/deGRMzDSnPnIYy9kNG3NuPXlB//rI/APSTnj5XKHXoJ54ltPSmhK9ctQ2Nw65FE8f96GA9e+twAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547760; c=relaxed/simple;
	bh=U2G5S1kTFIH8tXKuK0u+pk+jwp/6jWSIKAU/olOPQ20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WFtSZ05FIsuiAyqG4XP/aHPLp+ITYuQC8xp0knm578lZ3riwhomirLWKuFNSuZ+pjFXMeAbaZ0yR+1CoE+VauJgBkeUE7mW7/m/4rMCCyoA8ZKZgbm8gVWOzRQ83jrXkVb3FS6NXxjTd49hE2cgC24VXu5my0vd9kGaJVHlBbjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhf9ziCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INM3KIC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhf9ziCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INM3KIC5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbdXG3641675
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=; b=Rhf9ziCgbuGgAjf6
	6XH8dPfZdROJ5mpiII5EEFdiWfDJSY4OJuVovU8xIbQ87dIyHKzdk8jLZJD+Tnas
	WvqrlGhcPaJ8P9VkyB3oc27yObN05xn+NiQuYSbyhII4DkG6lS9zWKApbgpqo0jM
	GGrrE9wpQYBsS4WLcYBK//u7CyBirG8hg0sPr+8sAyVExQmlXKbY8n2CHwRoq0HB
	Me/hOHO6+FQ5nO/pZTsQQHQtlep0bpCc7F6Of6Zjwgy+3gETBp18DTxLRCbQP0w9
	m7TuIoHDUPaniwDQqjQSoSzGlp5p7EAQ2+x8JFFLXD7Eo91N/vkhril/nMB+cHwK
	nDbSqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d1fhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:15:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso17839605ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786547756; x=1787152556; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=;
        b=INM3KIC5JidGyJy2cC4CLAWG/YdEJdxAD89+XhSRArM4rd7+zf0h8Uvs094by0Su9q
         6LYgFzdy2uYMv3DL5XArG4lIvJBGbPz0acEYo/BjIL0Tm8t9HYVzGEtrLFUmAq8pHOeF
         LIIea75LSWCn2gG/lwwCCEJxZcpB6VBYlskZUabwgNZE4WZA83TuXszyilCiwFvGKjQ3
         THuwG0y6EnpMT4sB3zH+8UMr8ojd8MqTqbtnZ3OZz/wyrMAKioZnm1gSwjwt0QIm5uho
         9EkLLYd3fav748WZGNKuDWsu8OFgUUCSWcJR0+c3pJ5P4Gsn283dyo/c+a0j/vcIwe9t
         N81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547756; x=1787152556;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=;
        b=IcUuHLHqeKuOkVAJucR987exTTGaFHYeXkE4gqqDlX9vbyTCTQ8XWL4KzNBDoXJsRT
         QJ7YR3AoRMU10agZu9/rdcchq5KE6gTFzZkkOqAeIhv9HR1OshoqDobjyGHDVKQatccG
         PtICw5BjG05Az/INDlOUTp2NjGJNeV/L1w38kY3IF+x5ryjUF64nrRiMQI4eTExEjeJw
         KelP+/Jgx/yENWBNPyHeJnEhtP1ZDumPMUIOnn0oSCrkoEDPAPweUNigZwLUOce6WGXp
         qOTobJ6UhyAjgpFVg0GECKYgFdVM4x1+qymOcsMkr9qMB6VoLe7YsQmP7yfh0v+LHmvx
         E4mA==
X-Gm-Message-State: AOJu0Yx0C0hoEeUnYoo3ckDB68t5IZCsB9s8WzEsK9Gxwg35rqKNXM75
	TdQYc7xrM7twbGqSJoT0i+LDNxI0bST8xj9Mk2TuCGZqyMAxMcZ5Ojwy5aFmYdb/822UfHU2IAV
	O5KAAOkCCpMDdMEXr87uGTNc1xZ7i73YYW2clvY36nx2ZrENQPvjA+ZQ8Ne3n455Fqt8NFXl8Jc
	rW+I+lpw==
X-Gm-Gg: AR+sD10iIwIVaDfqOROi4MaUyf/NCLdUAwgQ6V+5JsDMoRIDTTZILFyorpPQNDvYZ9o
	0WaBr5i2S9GM0ci99hlEHaoo1yxn7dxvUpObtiKM3iLelGsl1K0GG0V6A9K3wyeIldzm0otIGnj
	YyqsQd29eua/M4JoiHtk5txhgIWymIW2Kdv7UbCJ2KfmZ6rUp8tlnAq3P/NdU+mlSUQ/OffGJgY
	8DSW4NT45zjRIU2z/V2K1OPSg02topInApVhAHVujRiViSiFFVuYozcnRPHfeX87BiCYEkapiQ+
	pGV0i8lJI2EqRojFAoEL3phw6lL1yzJq+FEmeoMo5WrLzAjxeYRiF9JDvsg=
X-Received: by 2002:a17:903:37cd:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d34560df46mr72972485ad.14.1786547756069;
        Wed, 12 Aug 2026 08:15:56 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d34560df46mr72971625ad.14.1786547755623;
        Wed, 12 Aug 2026 08:15:55 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219ee32sm8268495ad.38.2026.08.12.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:15:55 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:15:52 -0400
Message-ID: <51d0105b39278f46def5b14d8d10103e.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 15/17] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
In-Reply-To: <20260701142230.A575F1F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-15-2c61f94a695a@gmail.com>
 <20260701142230.A575F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: IrifwqZuxiXm2g406aX3UTI7armuVk64
X-Proofpoint-GUID: IrifwqZuxiXm2g406aX3UTI7armuVk64
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c8e2d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=7NWRS0o-2Gl6raFx_5EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNCBTYWx0ZWRfX1salJQYY4QWJ
 jlJjiG9leB5zjBp1RW/8sMhbS96lrVUG1IbTio18X7/7aVtUMip7eEXHM6Gy910JIH7GdqAqv+i
 r0VLckMLFyLuZ8rzaMiMDNbuTOyBfzduLj602iWaZHbw3O16bEi8zJwGljhvxUCLORJtO+r/GPm
 7G+3s2Z8tKpimAlmfFU+CpPbYJevJYn3T1LP5CA8Q7basx0f5y4G/V1VvHnm2HHLrV+RK0GEJfR
 pOsLIKaWaybf5PIVKbZFUukjSFqqpJeiBrhkcqk/3YtvWmcM0ZNq/OiYRd07TR4Md6fBOIyX8nI
 1t7IBOvnCPCyfQ+X0G7N11s+5aWnsRQf20367UMcXvjtontGnBIsrZPdJVbbdA4L1E6DzFEKDUo
 r1FAKa8QSP6YF8AQWUetfTw61MhkXmom0P5YWFlHuB1ysNL1vG5y/KBMZRrCNM0Na0Ey3zp1PsK
 /sIgd+Xf9PoECarZoIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNCBTYWx0ZWRfX1hXXBokwtF0u
 qd4BkWf/p5WYxg4yvE3x/Gx8Jxtj87nPYp0AVbnoL6LVEsN8rYme1ce3+vCWqq0XJZS43iMlJoy
 hDQwRBX9gxo7vQPyV+xqsm7tSYQZYU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120124

On Wed, 01 Jul 2026 14:22:29 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The RVA23U64 base detection wrongly mandates the legacy broad `B` extension superset instead of its required bitmanip constituent extensions (`Zba`, `Zbb`, `Zbs`).
> --
>
> commit e73d8757f0ce7270b4b39989368d4e83e5a355fc
> Author: Guodong Xu <docular.xu@gmail.com>
>
> riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
>
> This commit introduces a per-hart and host-wide bitmap of conformant ISA
> profile bases, such as IMA and RVA23U64. The bitmap is computed during
> init by riscv_init_isa_bases() and registered as a subsys_initcall.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 4c3bf813af052..fa8471aef42ee 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
>
> [ ... ]
>
> > @@ -1304,3 +1307,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  	}
> >  }
> >  #endif
>
> [ ... ]
>
> > +	/* RVA23U64 */
> > +
> > +	/* Supm with PMLEN=7 */
> > +	if (!riscv_have_user_pmlen(7))
> > +		return;
> > +
> > +	__set_bit(RISCV_ISA_EXT_F, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_D, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_C, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_B, ext_mask);
>
> [Severity: Medium]
> Does this incorrectly mandate the legacy broad B extension for RVA23U64?
>
> If a RISC-V device tree advertises the RVA23U64 constituent bitmanip
> extensions (e.g., zba, zbb, zbs) but omits the legacy unratified 'b'
> string, it appears this check will fail because RISCV_ISA_EXT_B won't be
> synthesized. Should this instead check for the individual constituent
> extensions required by the profile?

No. This was raised and answered in the v2 and v3 rounds.

Guodong
