Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB8F3C1F52
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581490; cv=none; b=KrQHW9tfaAYgip1yAsjuDiGzphi/dyj1GX64k2OvgrFllMBvsl4TFcGSKdkOXboSWiVdtuAKhH3Fa7i5F6jBGj8hxsKbsEqRPis3qXHZnvHojXMlJZ4DRNXvUz2w1H0b0ouN3JQk32TrjFEmAivIDZz9wYgYdykRozn7YPuzt3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581490; c=relaxed/simple;
	bh=18vDcgNXAmVBtJKzmgRz/Gf5nUM5g4meCTEo3uDOccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp/DaWRZ6KCYVf+zYHZ62k8MmOgVodCZ1C2erzdvPzdtSGQv5bJb5oFelmWIi2S3a1BRnExmGmU4DCHxKLwERqqrl0d0AvQjn9SKG9VoidxkJTLxpymQHa6xst7lHcD/AXUo9Lw3o5WcDGHkbPzs3mPdL6aqx5elis7AaZaPWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8ZpYNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3xOVHfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8ZpYNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3xOVHfi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Hva887989
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 07:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=; b=E8ZpYNzf/q6Ln8Pz
	0xjZX6+IrgoNYsv0ZuvoWD7B+bD90B39iBPnocHi70ZVyfeUwLeDEtM/jnjOzukE
	bV/JtolPzFCunw2ER6O7nMws58PHhPdv+myTcP8+mKzMiOWt4OZ/LQvuvN62bI0H
	xprQOJa4egfYd21oU3qgyYFXp5vqmNbjioRkiVqUwjXbe/kuvDz7UjYpbZAqf4zw
	1JY12HV3HphV3QmdWcEWzg93wEDhZeNBMtVju9zPSYd6uy6ff3r8FaOgW35VItvf
	vHMDhoRM8Cju4RBt47M4VZtTLENARfIXDtMyzwnNAoMpOW0RmKQ8VT8+KXdxPNkZ
	tyJWJA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq3389f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 07:18:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf5daf1f98so1483271e0c.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581487; x=1784186287; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=;
        b=C3xOVHfii+Gy/y4269TF4D9eYZHtCzLwN2NRJ597oBRY+QPFnV9Vx59y3zZo9rYZ9Z
         lVHAkSrZZ9rBUxTZscjM4YzYmA5qnHQCQiW9oz+dfuXhDyA95Tz99RWlAbcRMIZnYvOE
         ZRyBMjjoep7pfgWQZsVCtfTAmeCrfx56g2ZOV8gnpRUdabykleuu3rN0kEa3TGkUS+uz
         ZpCqHCt7p4zAF6z4Jo/peQhekWSvYpy6jyd7ldBS+70lQElb7Ch61ws7cGyvCDT5xKHW
         qSzGvdj+66D6C+e8f9DYAbCJerjlVjrd/6GyZR6TrJcFXOmfh4/AS3pUPz1NJ6SuNUwx
         Cxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581487; x=1784186287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3vhYLpK9v1e6+EKfY9vPvoKy3eJ8L7VUE+wq+TWyHRs=;
        b=SyuO83MymdeXEcWoJecglSBMdBgu8Lxa7Omy5XHFR68zoXIhcAa2WikcX7GoZ739wY
         MTvlBt7Iltup3l5EvOfLz2vZahGq4JoznQZZLSog3wYtWYylfT7OAJwLirHtG+Ehdh2T
         PunaXCT2aia6tDTo4QPy583xaRZz5HNcWjBkOnQzn0WjIYiGNDlvyVCYmfXzi+qCvkBl
         YSP5dEVxFjf0KEA+/cEEiqn0dIsxel/GfCCeCCbcfIcBZtMVz16fW4HQmy/us+e4Xygz
         WvVxpC4/ZA05yrKSrJoLsIf/2WabOrg6E4/OKVbGEkregnWgCV5OGOtxoYXgYOMgCFzP
         fBzA==
X-Gm-Message-State: AOJu0Yy3OqKFHFPdgMSG8hF4A5JhXlKyngeTw4P2GXruEypDoT9n5EZV
	+1hyt/AfyoyLX9QUJi/q2TcN3HSsoRglJVIwRrYh72jrmRcTsfnOKz5qEmzME7cGrm6eUiTNRpv
	KXGWik3rKEomERS4/YMyjNR6RGo5ZUOnsqbYyXAL8d9PxAIG8xdxAbnRxXJTlvhqpk9HVxoMKi5
	rv9gA=
X-Gm-Gg: AfdE7clPUHnwcVzMdn+L3WVlIPy9ECNIAqBnQbvNjkq8ocAGNQA71iPuuU4ZxPbEdWT
	l4mD3olKIpVZm8jy/QpQ1f9NEnUOzYxLWRLtwTxJLD4A/C9+s8MNKPF/SIorl8Es1CJl3X3zML2
	04+hI4wzHr1sdrT7LAp4+fMInioO4/RuloiiXhIOXqLJDOBVDrSaCM0UQ80twr3EAKvLaIQoHDR
	SEPFV4M0BADLQSPnK0iDtEkZ+HK2ttCRB9ByznUwgJOWg6mJu+h/Z/o9Dk/u8fOuvWPso5YkuDp
	Gi5Gixu9JoL6N91Kz82D2cb6nO5bLDWGbWUSwINki9nuyxHL9IolVXKvo6SlLNOs/6+PCX+AZrc
	mTitRS67fRqvHXBliliqHAW1vUSfQR6pQ6RqVdHp6RYTMmCZXyScKpwIRpAaobeyWy7GVCd/tHm
	r63g6ttwSpvvO5+XP2UL0rjHxN
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3587693137.19.1783581487229;
        Thu, 09 Jul 2026 00:18:07 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3587662137.19.1783581486728;
        Thu, 09 Jul 2026 00:18:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b12f59sm1999841fa.10.2026.07.09.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:18:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:18:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707102536.0055F1F00A3D@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: IvpRn5UR8KbXIH04-oy-frJgpmUWZKm-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfXxMcvNkzyKc0K
 256HLnXBD2lrr5gEWhe+mZK8dy+KJcQ/aCnY99LPGiuN/AdrHk1uCCIikntooHMF7V7IUbwlo0C
 SOQTC5WI4Mzonv84Hp8XY0vbz/ynsWWri2CY7L661nK23VcZ8OEOssZcAbDyplQSlYisTC1TkZ1
 wdkyIe0ZlP3sSEJR4qghyCfDLasH4at6iZ4KmPsUCFtZOwEf5gnjIBuXB/MfFiqkPPX3w+a+fWk
 DOdt4i0cHfXgEl1onZpIR10AaT6lewHVY8Wpw2QUdyu3yeTxI7YyHk6ynkOm/isi+YsmqQaHV/D
 kDv7ebLUZYm65GYKGXnoci1DAw5X2Z4OP6TfFQc4yw4cukZE/g0pRj8EUj5otg3Ul9rjdftY7ei
 z0wfJ31QE21jF67XtoXJf+cSIc4L0IvDA4LmPHsXiXlsrR2bnMpHkwUQ0PPEOCl8FbhHo04e49A
 YwsXcDJsGpw/w/enKNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfX1+ZJn9NU46ba
 lPvFULz5YbujGP7wMxCcUjLLO+ol6lFmp9ZEKYSMumaVMez6fwtru7wGWmu3l3heHdf22Mdfqwk
 cjI7z+iejVzjWb8AJ/Cqq5EzxIBMefA=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f4b2f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=m4A0djz7JSd1O-oJfEEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: IvpRn5UR8KbXIH04-oy-frJgpmUWZKm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090068

On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> 

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> [Severity: High]
> Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?

It doesn't. Please fix DT bindings.

> 
> If an older kernel lacking the Glymur-specific match binds to this node via
> the fallback, it will use the kaanapali_soccp_resource which does not set
> .needs_tzmem = true.
> 
> Since Glymur requires TrustZone memory configuration to prevent faults, the
> Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> SMMU or TrustZone panic during remote processor boot.
> 
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry
