Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0783DA7F5
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071940; cv=none; b=m1+O0soH4o01NZxam5ET42hIXqHfYgL3KF1Iy60DXFBT55Sa0bRMvGBzij9ufiKirS491ym80SgzN3Z6SO7srSk9Eb3GJO2PixZR1mYYu9xPJyqG0/VUK3k+kH5LJkC/ytwWiexshISjWILBag/p/zCmnPC3JLE9EF0otUvOVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071940; c=relaxed/simple;
	bh=wa/o6Wi5wk8IbgjeKtm6gBey3h1CaXtKWWjDqKE/4ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhZc+2tdfSeJP4ab+NWL3yDJw7ZG5ehg9SloTEhB+zxm9fYb+45dja6Ri2BfhoAvLleQR/0s9e5rUhiN9vKm1JU6h4wNQrd4l+wNWFuhWM5PQsxOiXdSY9rPiVf+7Z5gWE9RDDXeNkBgPDg7/axLs0H/kFG8LC3lbNoTNpOimds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YsdxUg4+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YsdxUg4+"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TGJTBK3215918;
	Fri, 29 May 2026 16:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ASf09m
	TeWrKjK8BDRiLhfhpWObufv4X4Ud5kvoN0jjE=; b=YsdxUg4+WabrGEUxc7VVGi
	9p8TemETvoYAtlX+9o6iNKOtuZh0gUQaTvc62t4NH/jPy6Wq0QCwh7tS3WfotS3a
	qXsrmPLKl2pYE+8C/w9zOCaB/6rlkf1rHAAseewRDXA2//YQ1qXi6fyhL0y6yxkC
	EFSfEx9ZNQCg0pGw+HclXkkO5RVnR5tgTOmG0PRjqt6uTo5f/TX7vy+yk+x26kxR
	tM02eaYxJE9yD2ttSe9ji1JbC62QHKU0BjfeYZYnuug13km6EBIMaGmU6BN1TLrX
	x/zWj5C9c8QtyGvEBy2gDSAJw7znGYg9MkDdZFKJiFIZRMkBIC0AKBLZNuHHFYHg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee88bn0we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 16:25:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TGO5vF029184;
	Fri, 29 May 2026 16:25:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc18rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 16:25:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TGPXqt47120886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 16:25:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4D6D20040;
	Fri, 29 May 2026 16:25:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F87920043;
	Fri, 29 May 2026 16:25:33 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com (unknown [9.111.19.18])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 May 2026 16:25:33 +0000 (GMT)
Date: Fri, 29 May 2026 18:25:32 +0200
From: Jan Polensky <japo@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH v4 1/6] s390/bug: Provide ARCH_WARN_ASM for Rust WARN/BUG
 support
Message-ID: <ahm9_FvOhggcMBF-@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
References: <20260529145752.1209016-2-japo@linux.ibm.com>
 <20260529153011.E0DF11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529153011.E0DF11F00893@smtp.kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2MSBTYWx0ZWRfXwr8EwwmebQKl
 KJ+Cz7ZhTsWnI9eCKGepG7BFfK1H7ZXtTOVo8TrxaskjuDJ9yVP0hpapW2DNYrpp6OiZRI3pmiY
 G6xvac0D0EKCG0pKGrnq0DXyKs7rOpbehip95G0/N9OM+k0jzKMMjjsd55ziDZ4Z/f1BYhgxv40
 v1oO3HRunnkO37EHVyp7x55Ee3wheiZbIwjQePHlPC8+dQaoT0+8vmOzCJ0A0pwXuWqjJm4CyVT
 OgeIbfpI1EuT1jmY5J9BOPwce/YuT5rYBmMMLoHRtOr3L3S27Z0XKjeLEq4CpDvvFCm/rls+h//
 ibG7bJ2xu8r14MuEDujnpeeyEvz1WneiV5FjSwM8V/NA/blP8H7+wmRPDbUgB/AVFP1tdho3ERa
 FefVjwqiyL9vxvrP6zMxmMacXBEb+ns/imP0UEfcr750onqFCHuWT09ow6COmwk3S4n0mScpbvx
 8oAE6ozeqbTIYEn4zfA==
X-Proofpoint-ORIG-GUID: B9UXqUGLEuySySCgLOl8Q_HZa7mE9pRo
X-Authority-Analysis: v=2.4 cv=IJEyzAvG c=1 sm=1 tr=0 ts=6a19be00 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=HjgG6N0uyAa9hyylWDgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: B9UXqUGLEuySySCgLOl8Q_HZa7mE9pRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290161

On Fri, May 29, 2026 at 03:30:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Struct layout mismatch in `__bug_table` on s390 when `CONFIG_DEBUG_BUGVERBOSE` is disabled causes all warnings to become fatal kernel crashes, which is inherited by the new Rust `ARCH_WARN_ASM` implementation.
> --
>
> commit 9d32da95322678b9fef8564a347432ce7d33be9f
> Author: Jan Polensky <japo@linux.ibm.com>
> s390/bug: Provide ARCH_WARN_ASM for Rust WARN/BUG support
>
> This patch defines ARCH_WARN_ASM and ARCH_WARN_REACHABLE for s390 to
> enable Rust WARN and BUG support. It uses the existing s390 __BUG_ENTRY
> macro to emit entries in the __bug_table section.
>
> > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > index 59017fd3d9358..a72439370f625 100644
> > --- a/arch/s390/include/asm/bug.h
> > +++ b/arch/s390/include/asm/bug.h
> [ ... ]
> > @@ -121,6 +122,17 @@ do {									\
> >  #define HAVE_ARCH_BUG_FORMAT
> >  #define HAVE_ARCH_BUG_FORMAT_ARGS
> >
> > +#define ARCH_WARN_ASM(file, line, flags, size)				\
> > +	".section .rodata.str,\"aMS\",@progbits,1\n"			\
> > +	"9:\n"								\
> > +	".asciz \"\"\n"		/* Empty string for compatibility */	\
> > +	".previous\n"							\
> > +	"0:\n"								\
> > +	__stringify(mc 0(%r0),0) "\n"				\
> > +	__BUG_ENTRY("9b", file, line, flags, size)
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does relying on __BUG_ENTRY
> here cause all Rust warnings to become fatal crashes when
> CONFIG_DEBUG_BUGVERBOSE is disabled?
>
> Because HAVE_ARCH_BUG_FORMAT is defined unconditionally on s390, the C struct
> bug_entry expects the 4-byte format pointer unconditionally, placing flags at
> offset 8.
>
> However, in the assembly macro __BUG_ENTRY, the format field is omitted
> entirely when CONFIG_DEBUG_BUGVERBOSE is disabled:
>
> arch/s390/include/asm/bug.h:
> #ifdef CONFIG_DEBUG_BUGVERBOSE
> #define __BUG_ENTRY_VERBOSE(format, file, line) \
>     "   .long   " format " - .  # bug_entry::format\n" \
>     ...
> #else
> #define __BUG_ENTRY_VERBOSE(format, file, line)
> #endif
>
> This places the 2-byte flags field at offset 4 in the assembly output, and
> then pads the remaining bytes up to sizeof(struct bug_entry) with zeros.
>
> When report_bug() reads the C struct, it expects bug->flags to be at offset 8.
> Because this falls into the region padded with zeros, it misses the
> BUGFLAG_WARNING bit, treats it as a fatal BUG, and crashes the kernel.
>
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >  #endif /* CONFIG_BUG && CONFIG_CC_HAS_ASM_IMMEDIATE_STRINGS */
> >  #endif /* __ASSEMBLER__ */
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260529145752.1209016-1-japo@linux.ibm.com?part=1
Hi,

it's already in the s390 tree, thanks.

Best Regards
Jan
