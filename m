Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8A318BA6
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868362; cv=none; b=CydFxZZEWAOSPuKTVucbbta4iHApI+mYi/9gQ5C9EoELxIxuQyVNezUVgKf9WUlgR39ulftmdfa4Kt0pCyGu/noqsm0y2lWgjsYYtNXMasG6cGs9R/y+4OS6fkLb7amY2LXg1rHbVul0vMy11HNjEZqxokziJ+ECqj55EbE0ufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868362; c=relaxed/simple;
	bh=sXyzQOism6s0iMWTs6y8t96TK1C2Rb+t0dl5WHR/bpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQqT0QP3hAYyZ8wSL1Xk/wySememuZIYzkg5xoj68YFZ6WeVRRnIBfx3ZmnX1pcIhbXJtGZagAj1XBGK8hUWVd6urlFtfr30Tv5rH9GvszK/kzxLaxT8ScwEWrV+AYoTrGf63HP6ZG5LlFYAdIWCOPzi3PqInp0XvmrhuoBwDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACVh28eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTSbp0jd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACVh28eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTSbp0jd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EknYn337467
	for <sashiko-reviews@lists.linux.dev>; Sun, 7 Jun 2026 21:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27Zx13bOX1sLVHA2pgAGb40i
	Z5XaOQdOLc8g1jx0NY0=; b=ACVh28ehbEBp3l5AAnzU44Cao9/pJ+gg1EcWgAvk
	BxlbVWAvvciNFfw0ko3vyyhv0grSB+fwIGBBubeDuu3fffk5bM8ESWflWZLJYQaM
	ONWhIVRSonngg6reY/4OXmPwrQT7SJSV2TOS6Z+fvYRKJdJL6CQOsT6LWq60bpMx
	5csvHicf6p/XcLUBQrHrD/Cj0O9MWNLpKzm3/cGJKNn5VBs5Uu9bKUM+t5njtN2R
	794eDLObi152XVTnopJ3QbU66SOcvo8f/yzGaaqPhIFd9U4ys+XRXk0lP+Y0PTAj
	g1wwbYxFHGqhAn60PUEJfPsYR95OzXMsaihA0E97oWYBxQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvhv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 21:39:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a94a743521so2906152e0c.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868360; x=1781473160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=PTSbp0jdc66lfZe8xoTvEbgDb8H8ZHm+/h5J8exE8fOzIcX2TRkgoorCMLDMTZA3Kj
         1WkHsdQaoovNWtyx0ugWcYH17sxJT/8sUW/aHJisqG2u+MOvBqzZ3J/DGc3dhKjWOrWD
         w+xEEaPX1tUWok8l1GhtEzjoDOmqOAaIQsu6ItJ4M1T2NP5q25IqIVP/Gz9Wl87knLj2
         uwBjjunDG/aRqyrkeE1FlklCwpqDJVbBXIAwQHXF1Zdgkh6olOj8cljL3dPrb3FwpfL0
         3QJ7jxOdUocfYljEUuJLWsxAXYbGRTtV8csgzz+PmLuvfaquqxU1EOsWWXwVOxtD9lq5
         vLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868360; x=1781473160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=T29M1BUpFPan1D72OSMEGRwgWX18GSOoeu/Qhpl+DIsIE2Xu24HVz7IcTql8tRY0+j
         I8VCfXlZlJF23NzpKPaK68ug8DkWbZqAHyMFw4bNBk7VdvhUBNJZs4CGxHSc4PzUkKJ4
         9EoZhhXuYZb82F//U0O9ci738TYtSBXqGYJoaLeD1B2TuaE/OxKvkzRSGJEd29uqQG9D
         FAFJ/s46sZObgAAWs3oXuL6yeRcXoK2L2R/XvAxbL2BixXd8mtQBXSgIaiyKIMf5CJAG
         aVD/A4SQraLZXbw73YQiz/3PJWVXa+0n6r+QwY+yd9CqClsfX8vtx6OIbxI0swGsaXkM
         P2NA==
X-Gm-Message-State: AOJu0YwV2CuxUhZV4qZtUYjxm2f/vUwZeCuK6YBv1+DxY33EH3Cjlp+V
	78qlLon9WSsVGogEfTsyxK7focm6jH2jH4PJLXjEy74NHEaFZzGv7uiXcDWxFrOhVUJGGShoXgp
	HkF/PtlNTw7d3jOVV12PoQMrZVd+3ilwmMZRQiSx0IWYyLGkHa0Ajbechd9WgNRruLg9m5gCoAF
	B5A4U=
X-Gm-Gg: Acq92OE/MF67fra/7S6qhDEozGpxm6Jof+nG0fXQ+QYBTSk47nc79PNUvC34/1g66BO
	MHZXtrj8cJM+uPo8ktQp0zsI0UGZPmotewJg7jCnidZKaIem7M0g1MPGkO0jiOXswzU1laHGYGM
	ZMMInGIT68HgMUcVoIooL48hCsh+q15TAfflBBdvTfWKGD0vALM0AWKAm7WW0oWjtHINeUcYAMI
	WzO7rsx7c1wK5QK84hpUJOjLsLV9ZwVvOZoaF0KaWZ8c+TXL3r4JN2fGQQmuaLrUI0VnKgGlIhp
	3zrX/H9zofPVhpjIuewh1GrD0EoEqfpJB1YvgVTVqZVYduR39qHJ1KxtYtrhlwleP+aZh+BHMg1
	YulePyqrAST1ORfs8qh7GGFgZ6RuJvSE6Z6dZN4TtpYOkYGtNdJGqIi//J/Fn3DkUVOnrLrALoV
	HP8Fisg0ljdW1UQLhgdYxlGRjBLdIU3OdbHFkUGUo5vyoVIQ==
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977364137.28.1780868359862;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977356137.28.1780868359529;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm3319815e87.54.2026.06.07.14.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:39:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:39:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143923.58E1E1F00893@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e508 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=s3xQa8otug5672-2qowA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: HIcnnP2hBbB2OT2vkoZIgu2tnAilgHEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX+9lKL7nsKvPy
 qBBwxIW8oZShQ4dKEaNAOSwN7z86BKe7GPQ9anbAbcd5cqPgrdQZLp7XSWXGrZBnzhAsJuIVWX+
 rlZOnKZZuwWHwmDWRg6SLFFH7k6tQCU0buwh9LcCgIlzXlVCIDgzsMfgEPxcRX0wJe5d8WBiwa5
 cDIBDnyPk6xaPjpgqtFq1vd22Ry59db4Jtm8zZKGnjVCfAIdYBSuYWd2bqsJBAPA4ufAOQ+fQrs
 4rRF2GGgw2cp0TQQSL4jZQjn+8ysotHmEpwO9ValjD7HHTioCflX5hkfim4R/66KVKfbgVi70ln
 HIQGI2Sp3mthdQG+edcjVpwh1Yx/ubCjVFe3JefRAffu0xN7pyY7Q/a1Vqe1iXlrvMLFppS19Td
 tav1LkQZp8qs2s98tmB4NS9JrlJoM49LcHvxDxPS7OBfW7FhghMQLJKGqUucEoitabu3Sw7I1pv
 T95Gf7rBUQU2HfGLkxw==
X-Proofpoint-ORIG-GUID: HIcnnP2hBbB2OT2vkoZIgu2tnAilgHEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> - [High] PAS metadata memory is permanently leaked upon every firmware load.
> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.

Hmm, please check Sashiko comments.


-- 
With best wishes
Dmitry
