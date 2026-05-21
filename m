Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0217555
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379469; cv=none; b=XGKWscWhqAJ3E5wnQEhHsOPWuwHFd8/Atm5OmKduNpU4ukEDiGICnBp9bb8NS+5nHoSOBAverJCUqWSoyo4jC2DW7cFLL8ZhFe7p+woF8LaQx5mh1uvO8hfnxHT8B4xjjyBNqwACh8XzN1ZEwuKGAP2fXoO2cKMZkqpZ5zU109s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379469; c=relaxed/simple;
	bh=NRJcXY86apRILZfSdeoZv9menX2f8HUxgi6kjZHl1gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHsyrGYKH50QEtOKoY46abPKXlos3ZUAGlvvkWo5UOPZpdXtMCU9G8l3H7tQB2lrFsLKviQd17U3WPh3QnW9RrU4ZIvVaptat+lDn+ghN3CzCdR/j9uV1CHWzKXnxZZLAQV8Fl6uJi1Me6nPd04bNvR+xv9uzOWgxEU2MmGNQNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Qgt6oWtZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Qgt6oWtZ"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LE0Iwp793884;
	Thu, 21 May 2026 16:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Rt02DN
	tnCK8S13JyxgzUofS7glE2x0N3HItQKoJdGaE=; b=Qgt6oWtZbE9mVNqJnJ4NLW
	rVKPESxeFvUUmWuxr/FJ4V+FxFLUjU7sXsfDJzT+B78z2NohRBGOkDkecGH5W8P5
	SDte/7moQCkwvv5E2bDGQP6TC5WjJuU5Fjlux92GCJV11PpoBATc1B141SJjZ3sq
	biIGWPFnYgV6uMADUGt9XeRP2AAtklILfv+O++Q0ygZaw9ZBvFn1IfByKvWHfSfB
	JE+3LZSib74cPm8VhRtKyzfG0z/zWyOkrh6CGS1XuZ2nBJS3iEGn0GDAQDTS9K3T
	Ex4iac0YV21y7RsVrA64iVjFtskQYxMLjpGk7KemHvt35msWqSb+CwbgIow3wPrQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h757xyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 16:04:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LFs8T3010774;
	Thu, 21 May 2026 16:04:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e74dhw049-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 16:04:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64LG4Mcj60817860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 16:04:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A7962004B;
	Thu, 21 May 2026 16:04:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30FC320043;
	Thu, 21 May 2026 16:04:22 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com (unknown [9.111.26.175])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 21 May 2026 16:04:22 +0000 (GMT)
Date: Thu, 21 May 2026 18:04:20 +0200
From: Jan Polensky <japo@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH v2 1/4] s390/bug: Provide ARCH_WARN_ASM for Rust WARN/BUG
 support
Message-ID: <ag8tBIylibjbxFxo@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
References: <20260519151215.1611802-2-japo@linux.ibm.com>
 <20260519160011.D8D5AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519160011.D8D5AC2BCB3@smtp.kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ffCdDUQF c=1 sm=1 tr=0 ts=6a0f2d09 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=qO9SUeAwehQocwJphKcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: ZQlbc9SjluRVs9_PWz1BVFQa7aW0Yjqn
X-Proofpoint-GUID: ZQlbc9SjluRVs9_PWz1BVFQa7aW0Yjqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NyBTYWx0ZWRfXxw4bSKl2Vg91
 zN25R6qDFsMi1h0PCRqHe2C/GCVWk4enm6Um/GTYHu8G7PQWSWk7kAC/8/YajE0kFM1hxXZF3AF
 TGS0TdZS5uoUmQvw/8CfAewQ6qIm+eUpaA5ptPyiPZ0Ne4aZ0fSIhs7jylFVT1iXBeQgZOSLfN2
 NMK39dGZFUWfWRyqeYnzQq70nOn/VD7EFu3hh0kpEEnJ7x8JiBHh35hURL9BpWfLMNwb//J1BHh
 9LqsLqWS9ke74e82zT1Oqd2AgdjAZYmUytDCvFc867kowpBx81KcwcwZOmdGcsbxu4WKUB5MazY
 8qXQEGS+JTsf+Pn8ERw5dKJUtHbwJV334QCzyqIzozni4qKVmOdt1qQxDajwYvW2retsXU1Jtw5
 uj5+CC/kjF0BiLSnSf3VOxQimPW/OppyIUlQav4xNQANma3ju6jq2V93LjAYcXkD8rKSuxS9BNx
 ZleZfAIhUP2U/qZkMGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210157

On Tue, May 19, 2026 at 04:00:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Struct layout mismatch in `struct bug_entry` on s390 when `CONFIG_DEBUG_BUGVERBOSE` is disabled leads to corrupted bug reports or kernel crashes.
> --
>
> commit 36be8811df57aa4ea062f437812266dad27b490e
> Author: Jan Polensky <japo@linux.ibm.com>
>
> s390/bug: Provide ARCH_WARN_ASM for Rust WARN/BUG support
>
> This commit provides the ARCH_WARN_ASM and ARCH_WARN_REACHABLE macros
> to enable Rust WARN and BUG support on s390. It defines ARCH_WARN_ASM
> to produce the same assembly sequence and __bug_table entry format as
> the existing s390 BUG handling.
>
> > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > index 59017fd3d9358..a72439370f625 100644
> > --- a/arch/s390/include/asm/bug.h
> > +++ b/arch/s390/include/asm/bug.h
>
> [ ... ]
>
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
> This is a pre-existing issue, but does the struct layout for bug_entry
> mismatch between C and assembly when CONFIG_DEBUG_BUGVERBOSE is disabled?
>
> HAVE_ARCH_BUG_FORMAT is defined unconditionally in this file, which means
> the C definition of struct bug_entry always includes the format relative
> pointer at offset 4.
>
> However, the assembly macro __BUG_ENTRY_VERBOSE only emits the format pointer
> if CONFIG_DEBUG_BUGVERBOSE is enabled. When disabled, the assembler skips it
> and directly emits the flags immediately after bug_addr.
>
> This causes C code to read the flags (plus zero padding) when accessing the
> format pointer, resulting in a garbage pointer. It also reads zeros when
> accessing the flags field at offset 8.
>
> Can this lead to corrupted bug reports or kernel crashes if the garbage
> format pointer is dereferenced during exception handling?
>
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >  #endif /* CONFIG_BUG && CONFIG_CC_HAS_ASM_IMMEDIATE_STRINGS */
> >  #endif /* __ASSEMBLER__ */
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519151215.1611802-1-japo@linux.ibm.com?part=1
FYI this is fixed in the s390 tree by
“s390/bug: Always emit format word in __BUG_ENTRY” and should land with
the next merge.
