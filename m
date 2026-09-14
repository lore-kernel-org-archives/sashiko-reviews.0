Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37306443C33
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386103; cv=none; b=p46PtXu5/4dmlgK7ptEZHWiVQnmIZxndC5lllfNb8krqC55mWG6MNP9oBKzOrjqKZvdZuhGwQXRAcBRPsrMV01OB7cm4kIxDjm1U1/7mEPNLsT537tO1ZespVbGymT5JXh0hIaqZKq+f9AElpokK5bZE+rUYBh2EcfD548W7QAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386103; c=relaxed/simple;
	bh=bMyaj79Xj8SKgL++6asrV1IEx4PQu7LtkneHOHihzcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf/OSy2OKEVYgwdMhM2BPWm90+ARMQV9KMTSNRIeu9xntHvm74iSNDho4DlMw2081xuQyr1XcVa419cz2ZCI0psdZZ/sASqA8T1rrQ6UX1uCBFhPuB2F0lzeN3DuWjAYYzUH2mj+QhKgf5C8TSrbo0Xizy9o0dLDIvrVijBJ7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQwNE3rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce3MSl8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQwNE3rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ce3MSl8/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7UT3793323
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q4hZNtHH206ssQDtYMttSBtL
	e/TkFZ2gK05kL/0CYqE=; b=ZQwNE3rv2eCOTbg8qNXMeTGZWJfs6OkRhnoAH77j
	DfGFeZaWw0OFJWGXpLVGKFjbOCiRoz7KmcsWGcfpCchFzHxqSdedOWsX3B2an2VH
	hShiesPjDwxJx1Edu68NOyZRtv/MT23foXa1WwcU2vF1zUxV9LYCJruVryccJhbH
	4xEAjcRdPWOPtcNTvRUkAFZsys6Yh2OsZdvxdLAuKqlzSNJADWAkXD4pRWtcqC9j
	9M2qRR8oT1Ba1blWpISf1RcvNjYdttDkV8ZfpaYLeTbTMPM6j2ueR/MiUfaX7jp/
	V0ZkEbyasEAW4VTxxR4tOVHIZ/4uFEpZ8MHTW4pZ8DNRvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0xn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 11:41:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so288788085a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386100; x=1789990900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4hZNtHH206ssQDtYMttSBtLe/TkFZ2gK05kL/0CYqE=;
        b=ce3MSl8/xb6P4dWLktbUvPC4CpNlMLkV+DaNhAbRAUhiNYMQ16H6xa6mKSiXIRCbZo
         DXmsn34x8BwHNN00kLPYh5NO8yWEF+sye80mKW3nagmmhzZhpUFq6MBnUIt2K4H7WpDg
         QG2K/JMOJMUeo2IDcofLSEmNvqkAL7ELW6G10lF+TlEF094icrggKDgPdvYR8NmgvfBa
         EDl8qmqpOlf4k3N3koIleHRSjdleyJMK+M/1IQHtUU16I2o6gX9CvKsjxtDP2vSpia1j
         UZ6dpfjWYGA6Uo/aklBmNHUVI45ezEPb6rtfUf/qYq/szK9rpY24sbLb54ExTCi/sE0B
         QQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386100; x=1789990900;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4hZNtHH206ssQDtYMttSBtLe/TkFZ2gK05kL/0CYqE=;
        b=lXfdhVdnJHG4CDWFfyrRXT+1ghbfwd9cMX/m9v6Y41zpaHBHn8Ij18BjUbey041NwH
         YWRRdayLQBi3Z06lKdcI1MJAPpcLonrjyDrII8Dcuzc4477QgcRWv7L8puL24IUK6IMz
         MdywhquvqbWVc++QDcOgXABfNaXU0D8EBO4C982vHdpz+t/dhp/dhPKh7tVZYL0VfrHF
         etEYrUBWZi6KkXWJxCRS4j5rxqoh+BEFYjrv2yifZS4nySLjTSxcop4FONgKN10Tne++
         ZpXU0WTGIEz5wq9LGHwPb9aDWgT9fr7s+iKc5hjUAB4dUvyV6JNeGovnZh6aVUHhe2Nu
         t6VQ==
X-Gm-Message-State: AFuF++mn5uVfW+og67Yu1Giwqazq+XbvumEN9yZAAKdFM3Tp1vkEONdc
	3txoFQdK4ge1xHEb0crM9JVJjqwWM2Vo+XPTQoGsqF7cNZucyE92zRKITZsK4XpXBU8I0ynqvU0
	5lN852Wr5yVMgYYIBEYoYcbEphuFKPoMIaGHJBUZBgys1yxKokWBCrZxfjbC0xYA9IhNJgG6pwd
	wOqus=
X-Gm-Gg: AYBFou29gUdnEBaVtzySGCe07d5ZowzjlrqoM7o3srDzaN40zmyhje7PNGhxZFVjjJ8
	lThoRq/HG3X0K1kMcJjW3nYUZt1BM80VzaBonclAHfZ/3tWxA079FTga84ETckmwG/pdNZbVwFu
	W27QyryWBcIgilluexeKQPN0uNgXiDw4k1d3XPC5P/giT2h6EWXHuxALKFNZm8Q77m+U/xYqP01
	dpcAlnjmBkMVQqBbq57FwMyBpI07f4N6+ZI9f2O3oVBojvIGy6cssLlmQ+gReVm/JJjzLyjvMkr
	Vfz3c9fqU8WwRTX+wCBfTXA0aszzkkIITiqrp5T/bB0t+Xtmv/w3v32BQf2xr7RgcRe4wn5aMlU
	JkkP53YColBn9nw==
X-Received: by 2002:a05:620a:470a:b0:939:f477:ffc7 with SMTP id af79cd13be357-93a297cb926mr321949085a.5.1789386100091;
        Mon, 14 Sep 2026 04:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:939:f477:ffc7 with SMTP id af79cd13be357-93a297cb926mr321944585a.5.1789386099459;
        Mon, 14 Sep 2026 04:41:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm26189080f8f.24.2026.09.14.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:41:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:41:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Message-ID: <bvku36cnoyfo6kx4rbhzx6avzoje2beaio6ohziy7hegmbwtly@42sgvqmatigw>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
 <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
 <20260914105243.682101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914105243.682101F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7dd75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z0zxWqUZ7HtY6bVccYkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: d8bQgCBDJZGduKkezNsfWzF3PddBQWE7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX2gHm8m2/5ezA
 pu38pom4m/E4qJgGN8zkDoazSoCfLPGu5WpoTQAZDoVVQ0M/600bVi8lCyfQM1UvODTmqB2lBOa
 ojrHFxZrR51n3c1kGMEfe+inWSB4pC0=
X-Proofpoint-GUID: d8bQgCBDJZGduKkezNsfWzF3PddBQWE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX2/XyZBwx64Yc
 2npd6zM7VNJFqQAjH0xRdxVUpv1yIA2LZI3rn0SAdOhLTAfxRnwt8LMcHk/NAEQ6O0YtlpXTgyg
 KUBTsZIZ+Lqv3tmX/Wu8SgzEGqdV0ZAPVBMJ2vc6Dr1wPC9AE8C1KvDQYzCxBlKIEY3qoDmNH+X
 sB7DCDzwR+ARSYMZsYXeJa0K5tk6eQ4LWnQn9Dc/0zQ56XaQNzrez/Er9lX0PINSNC38E8QKrFJ
 r8O/HYqPnQuaTPu4YvyE4Up2yr4WkqQ/I4nkQmT4LHYtSX97g5MGqopUo4kQ/Azt0Asd6V9Zc/a
 tmFQl2QrbOlfXos9megjprhN2iYPK/8qOuIGT7RaWIjSzsgPC5bv+x1Wi65Tub0K8cxx/4a9dQr
 JMyehVu2qUg1KeGIs/h0OF8jd+1uz0zrSQcRvNYXG9TYEe6r5cnZuYLl/9MPfoiOm4kqj4dZ3Uq
 vNilPIG/UwTFzlzDbVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140166

On 26-09-14 10:52:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit renames `eliza-cqs-som.dtsi` but fails to delete `eliza-cqs-evk.dts`, leaving it as an orphaned file that includes a now-nonexistent file.
> --
> 
> commit a1174aba52e7db785b4c5053b74679986a1f1e7c
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
> 
> This commit renames the Eliza SoM EVK and Eliza CQS EVK to reflect their
> eMMC support and differentiate them from a newly discovered UFS variant.
> It updates the Makefile, adds a new EVK dts, and renames the base dtsi.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index d6547fb18edf0..ccaca98ad4c8f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
> 
> [Severity: Low]
> Does this commit forget to delete the corresponding eliza-cqs-evk.dts file?
> 
> While this file is removed from the Makefile build list here, it appears it
> wasn't deleted from the repository. Because this patch also renames
> eliza-cqs-som.dtsi to eliza-cqs-som-emmc.dtsi, the orphaned eliza-cqs-evk.dts
> will fail to parse since it still contains:
> 
> #include "eliza-cqs-som.dtsi"
> 
> This will break any tool that processes all device tree files in the
> directory, such as running make dtbs_check.
> 
> As a side note, previous concerns regarding this patch dropping hardware
> configurations appear to be unfounded, as those configurations were safely
> refactored into eliza-evk.dtsi in a preceding patch (commit "arm64: dts:
> qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic"). However,
> the forgotten deletion of the obsolete file remains an issue.

Yep. Will remove in v2.
