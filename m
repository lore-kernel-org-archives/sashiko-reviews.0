Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555354;
	b=rKOH/b3Q5iQRlrNtcCKYa8FzbgO4YepNaB67xQRQmjsjk+1tWezgE9MBeX4OPTBZfxMV
	 NMXcYyXnG106MinP0HX3E2z6U/LEOzlJzbuK84QQ0BUh2P+HUdhupRp/I84NxrJjBZaR9
	 y9t2gCZR66waWcIt8GB4vLmt4Gmf5f1GEUMfQDySeE7MLYkwiLBzebvaCARZlVnhOgYtI
	 9FFqNlTx7sjbuadbxd7VLml+USde/XiEBb8V74KrkQiInuTAs9DQyCmHRaNORZix1xmOY
	 9EgE3yDWceNZmlT4S3f4eqziInyFi+7eAsKIAJrq/bjXBdLLg00AHEr1A9OJMG8wifw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W08ynuNH2qpl4faB48VJWBnQidu6XrNwK+C0td19Bwo=;
	b=UK4KksUy4vvlI8ODpUR5ejqI1mHU3Clj/iHZNEfb56J+B8SpCf6Vop6HPMXfi39vTnY0
	 w7WXrejzJj4Z69J/2AshO2EjAk5gL/Hh4dGRpyljrz/cNAXcbey3M6jQvmLSRlOc1voEA
	 bKyNNmC+Y+glZ8WkuD7Q3VNZL7Z4afYBvuIYtr1ITyWZGD6QHPYA4B5llVVrK5W00wjv6
	 EGNd+5tH/SSCX3Qp54aVzZme8S41nYzYqp2ZQWEYkPcQCGseMXJqW5BH/SAnQyMqqZdub
	 ySJYGtshw8auw+SYTj+anU6OInxiQkBmUUabeySQGrJmJ8LjsfVfaaccqd/t7tmGsDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzBFYHuM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQg9aWIG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2774606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2774606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzBFYHuM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQg9aWIG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5akWK3147327
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W08ynuNH2qpl4faB48VJWBnQidu6XrNwK+C0td19Bwo=; b=QzBFYHuMLa7wUI/j
	NCrA2NODtnYThMoE0JyZP3zAq1HOYCYgfMdJPdfFoRG8hTfdCu+THipb73zmwAjF
	BEeNfBygSBVVy54H7K9rUQLQwT0V5XuZLQWAy2i94ABhtyt1mKsNNIG0dTQ5B1s3
	irOkGdOS+910SGmbZWuGUTqCPzyNlrRvL6sec1Ql8FtedJX0Xq0EyCc2Xve1c6Mp
	gqct6jdgdTlgMzdrVjak0yTbb/fYNA9hbC+Tz3teCMGMRsMucLqLjSLekeb9Dk4m
	vmOHa78aHeMtenaVrwT7gzxDl5STjIbbSI2m+34efd1TxJR1lan15mQtbWu8Lz6+
	b2M/uQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8cfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:35:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so870352eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 23:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555352; x=1795160152; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W08ynuNH2qpl4faB48VJWBnQidu6XrNwK+C0td19Bwo=;
        b=bQg9aWIGdal1ZQGpNMKN/+L0zWsgt9MAuASu7UFc0ABZjEjA24KHOw79iyFEUA2dBu
         GgsDJ2tGjoIIkrBRz5TbEqTQ4SMgFXZyiy5J5LRRHC9Cxecgt+exbxFWn/G2FW7TStJV
         a+FnevKOoFwph8SCq59/67qcayQd6Mdde/ivKcrDehRtG2U6gv03C0AL5Ww0LmtuwqBe
         RTlYiosJeFY1A7G76zA0hEUF80j/fg/vPcwfsr+m2NLZFmii5qNyrWJkCwqs9le/4EBa
         oeUiLv1k1+8uABYQHXCd4kxA/e6ddlEA/gPiBZXGkraRU4fV6kwH/d7OVccdGLV7JU4X
         Injw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555352; x=1795160152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W08ynuNH2qpl4faB48VJWBnQidu6XrNwK+C0td19Bwo=;
        b=SeHR8wfgOtVayZPmhessX83PVWiOmLx+uKAgu40Ugyfbn7yltjUD8LZlCRqdN03WbJ
         TgZfXg8BV5us/uxrScMobQCyiFR9OS3m0NQK7zycBmlQmRK37FfQpfTI7xTyJV336zzd
         48+kCZy9Are+/v65Y9o70RILZkaVDDCamlU92O6SOcsHmHR00uiGPB2HLPajkcUb3jmI
         3IKT/aUAiCg+OavC4l0R6PVB1sVh7iyC3XhNqXPrFLF5IcwnOZCYNUAibY/GD3Poo2O2
         Io7eNzC9UcUuZx4DPZ2vrQkblPmbN860eNXgw2LOGJv59il5OgZml1X3SqU5AD3Hxwdc
         lzgg==
X-Gm-Message-State: APuU4Z/UdSK4ryhF5COSrUK7NIPlrmSOPptCix6zbbdwFEwlI9VD0p5G
	rc6cUJJN3nXJ7wYn4u6yb26lddLwZpqhknYQxeoPmObQp41DMTjOHJyjkvr6XVdUnLobUvt0Rra
	JtdkH+mt3uybRN7cQYSl9vDW+UesiGEtesMesLLKvEy9lvKu3RmN3ATs/6BHBiGa/E9QH91ey1E
	BsCcc=
X-Gm-Gg: AYBFou158X8ligscX9KFGeJ/0Ni9KvNnw8rE7nbiPcFFuUMotr7uNLfND81pvecUAT1
	HtHFkVFwEZnEm/wyK4A59zx9ADkPUvTpKpiZp3s2VlJ7nD2XdElCjSrhf0egdJgkg15H+LHEhZw
	UWur9VkNxYi7NS3Qy9uiyMcXLjeDU75jqUv2gNE00aFlalY4Q7TpKiCebVuXTLQdOfGVaKdmMzt
	Qxd6Vkd6Ltlgw0oCZe41apKFp+8dNlRVmV1Q1+WMSxYH+0O1fY/Zuoj1aj0TVipOpqrL1SMftS1
	GhCDviYd3UY+d2CQUWiIh3/9tHdwHbn5wQkyFgxEGerL1BzgcYeZn2mcx0zmrIjhAeNsfsUkDI4
	dfUYFEyegn8KnoG5HPG1ddwelXX74etYLB2gyPf8PlIrEBHZG/NY8aIEAoLCgdUEHMyYsfG9KOr
	I=
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr1514774eec.25.1794555351364;
        Thu, 12 Nov 2026 23:35:51 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr1514753eec.25.1794555350669;
        Thu, 12 Nov 2026 23:35:50 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm4960626eec.15.2026.11.12.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:35:50 -0800 (PST)
Date: Fri, 13 Nov 2026 13:05:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH 2/8] drm/msm/adreno: migrate zap shader loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113073545.5wktaqlnon6yajcs@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-3-mukesh.ojha@oss.qualcomm.com>
 <20260926155936.8DE5D1F000FF@smtp.kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260926155936.8DE5D1F000FF@smtp.kernel.org>
X-Proofpoint-GUID: XKDzSlVc55RfVLtF0HBwTpWCBRlKZZ0A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX8O127EB7qnib
 aOjhlaLjotGS2+a2eFnuMq8wK2cG0+9+S0o5yVxX5Vha3CCuCwxGf9lK+iGaN09IQ6OIcO7bMoL
 +7xiVIzOWDOgvd5eCNVKnHPCbu4EmUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX2G82x2pDj0pG
 PGEiKFtYKifnNyQU7+BTuvB9AEQ6IYDfKfpaNDmI7Fzn+hrvSbIF4c3tdXxx57x8LZY+cOV9COC
 pt/CMqKXHI9G4jRgePaMBBNkPjilofA00EssrwtnK7mmRle2oZVD5bHCO/erl4gAX7eyhAAM8n0
 RbjdPufFjMKkVbAoOdH1Khu5PPFxEbspyNAZGjI2PsiC3/6AEwECjZWIi7+dml3vlULjRX+PBHm
 /1X1njraiNkn7AgOwIMlYTqsfsEatZHk2ENylaVmX1gWEO2+DVuTc5ovoCzpsuJ9Zn71UraUQTp
 3r8Vc9Ra4BBDsh5kIqT+1yNp/Tlc9YgzE8W9Rck1hf0ovFrzKpufZCDalOl3i9S//d1DQYp7J5H
 pkIOdViBsNC69f5zoA5Hr7Wwr9/I8jXi7Ogg/SYcDBKgY11JhPm73YNciBbSaGsv6cjqjwrhgLs
 1Rg9gGh++4VV+kqnxvA==
X-Proofpoint-ORIG-GUID: XKDzSlVc55RfVLtF0HBwTpWCBRlKZZ0A
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6bdd8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=CW2y-Ud1XA8kvYtVx5EA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130030

On Sat, Sep 26, 2026 at 03:59:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] drm/msm/adreno: memory leak of PAS metadata buffer
> - [High] drm/msm/adreno: shmbridge preparation step silently skipped
> - [Medium] drm/msm/adreno: struct qcom_pas_context leaked via devres on post-probe retries
> --
> 
> commit 4d137953382eb8839541fc9229948a9472d95133
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit replaces the open-coded memremap/mdt_load sequence for zap shader
> loading with devm_qcom_pas_context_alloc and qcom_mdt_pas_load. It then passes
> the context to qcom_pas_prepare_and_auth_reset to ensure the shmbridge
> preparation step is executed before TrustZone authentication.
> 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> 
> [ ... ]
> 
> > @@ -122,9 +122,9 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  	}
> >  
> >  	/* Allocate memory for the firmware image */
> > -	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
> > -	if (!mem_region) {
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, pasid, mem_phys, resource_size(&r));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> 
> [Severity: High]
> Is the shmbridge preparation step actually skipped here?

yes.

> 
> The commit message mentions fixing the omission of the shmbridge prepare step.
> However, devm_qcom_pas_context_alloc() uses devm_kzalloc() which zeroes the
> context, and ctx->use_tzmem is never explicitly set to true in
> zap_shader_load_mdt().
> 
> Because of this, it looks like qcom_pas_prepare_and_auth_reset() will hit
> the early return (if (!ctx->use_tzmem)) downstream and bypass the shmbridge
> creation entirely, leaving the behaviour unchanged.
> 

That's expected.


> [Severity: Medium]
> Can this devm allocation cause an accumulating memory leak during post-probe 
> retries?
> 
> Since devm_qcom_pas_context_alloc() ties the allocation to the device
> lifetime, if zap_shader_load_mdt() fails and is called multiple times during
> runtime PM resume or GPU recovery sequences, the context allocations might
> accumulate without being freed since the device remains bound.


May be I need to find proper place for
devm_qcom_pas_context_alloc().

> 
> >  		goto out;
> >  	}
> >  
> 
> [ ... ]
> 
> > @@ -165,9 +163,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
> >  
> >  out:
> > -	if (mem_region)
> > -		memunmap(mem_region);
> > -
> >  	release_firmware(fw);
> >  
> >  	return ret;
> 
> [Severity: High]
> Does this exit path leak the PAS metadata buffer?
> 
> When qcom_mdt_pas_load() executes, it internally calls qcom_pas_init_image(),
> which allocates a metadata buffer and stores it in ctx->ptr. Unlike the
> previous flow with a NULL context where the buffer was immediately freed
> internally, a valid context tracks it so the caller can free it.
> 
> Should there be a call to qcom_pas_metadata_release(ctx) in this exit path
> to prevent leaking this physical memory on every execution?


Same as earlier, buffer will be free'd immediately after below
change . So, no leak for the buffer.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com?part=2

-- 
-Mukesh Ojha
