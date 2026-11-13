Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553649;
	b=yqItCPsgTfflI0UzeC2tqlQCaBPnD8e4x4HE0jqgSlMWcxUrWfZ4THRsEhnBgUCBzduG
	 DmQQ7Lt7nr+y5OYPcsF9s8IXx+PazFVApxN8BsemfOK9VuKgjWc2CLZcaQZKOCOb/I7mG
	 TorOw2VNhwxFPdgaG6BRgEGWhTR9dQXw/mQcAJnYKPEXKAf+zOhC5D8QUS5gEEWx8yg+H
	 sP+IInYyrZ7RNbRPMLEv9+n8VYbhMqtaJZZCdPuhnvvGoFEndkfDWBZvEQ3pIhl4CufKI
	 syjsugNQP+h4OJXP63uTsLPI4+AsO2zsHqqhvWGppgLCGeoYnWXrPtuYoJvui9JQffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p96z7gHlJIyggbtxrEpMAQxh/HyR0haolziTZhbBFGM=;
	b=ngnCJYe96JHOGJtjxc4lGIAV1hfZKgPYzHmnX6ag+WpYG+PvP/Nw5SFoVdOUbDjAd9tu
	 i+h9a2GUmATKY7dTUaijJsVfNVWRg/wOPTGjV5of7IjX6u/PVehYvFdecpOrIUl28I1kU
	 mjiWGWEk5DOJBvX4swHaRSIiiM3Atd5RfxtsiHTgO/TnuA2QRd8CVtiVWpV0vGGryRDB7
	 jLllbRXWH6jGaqG6l8UvNJ8b/ROWDZijbjuj45PocMZhYtBzHcxaDCpgBV0uHZX6ibXG5
	 2lbgirqeCl2xM6sZJSLiNpTiyUsW1jKt6SWiBvh8aQ5xMZSWF3n2cvrcbew8QlE/NXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nvx92ajf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWCkcEP+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD40606A893
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD40606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nvx92ajf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWCkcEP+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57COa1973140
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p96z7gHlJIyggbtxrEpMAQxh/HyR0haolziTZhbBFGM=; b=Nvx92ajfVht8X/yW
	6E06eUUrA8LIxC4ChTNzY4Dn/H6OqCctIvAELHzgOIukcltNdrMpQV3Dn/y+AXEo
	aZFBK/cXhdwjxF7uMaVn/4B5nMHN0d+2npy88I2nWbQ7TfNM6uorZvmZMUv830r0
	ctYN3auiNcTz5LFwNKHPjajTNtFfjpEt7aiKfP8iioXbID4d3gdvEANYZLAegmSv
	lEmDVj2R2HD9vwgy5hRXB8cvYroM9vTK4QcQpyrLP8vZlxfdMqGYvPC8XTbGfgAI
	wk3GRSS9K5ioCubvvH5wqzYkjvlEZYT/jF73p1UMge6E4KjO7B42v8+jXQJ+Uq04
	6yFlrA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1baxw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:07:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2563352c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794553647; x=1795158447; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p96z7gHlJIyggbtxrEpMAQxh/HyR0haolziTZhbBFGM=;
        b=IWCkcEP+uWSdFwn9ASwTius1TQF8guRRJM3oDMZ5tjGHzQBtur89hjoFB36kMVxkGV
         kdKeeEkCDfbRDr2VlCPA5i3NH3GJthMQvUMVgrrd1r0skrWju/QF51D/ygYXTg/4gw4y
         KPCsmfLVc7gldi/h+1pIZm4fu8zr0/3o0w5fXK0wdwObi6qq4PK1RjD2AkpHb4lSCfQT
         mSvhjzfzosB+93R4HKqHTg2q+EbJTuzHozW/CZ5M0JOlYITK4QDaOWxR6lIzunXFe1Ea
         IrEoJDdQxJ4/x+9YGDRb5oXC9SvG7878xGYaevlgzptYga1zw9CDNSfkBxtqZqYGt3Qa
         ns5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553647; x=1795158447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p96z7gHlJIyggbtxrEpMAQxh/HyR0haolziTZhbBFGM=;
        b=kZY1zxVDscbih7xE4YbVqVvDD2vMrDeeuwtw1UROSXpkB86QzMDcolQL1cdq+X/DqO
         GsZsbKYp/dmNWpkLR2UTP3ImZR1URHH6eLbt5TrHbYkXk3UwPignOC5PZGboo7tGhpPa
         dU8d+FF3GDFGTpcBZvmM4hUqVIYkxC6LGs+wpytClpigKl0wSVNGYxZ5O1mTTEGDoqay
         ymaQ/hOvDN36vcNRWfOEPiEzNoq/DL5bpkWThS/mXsOfBN5zYmNEDZGcGjeLvXIc3yGj
         DlYX9F5U7kJw0uLImZoCOyuXKVVOE9YhirM0l0T2nnJuIryHkucCHYpVSkROxoUS4E01
         1hjw==
X-Gm-Message-State: APuU4Z9pNg8zcTW7TebPs+Ijk/u028+6m1gmnIvM77dR0TrejGgTa+hx
	B7AsMciVaorIb914h8tAibt2mhKMOAdu35m+/pOw2ZZIeseKVe+GfD7IE8fAaBjmHPJxGeVZyS6
	vNg+3/8/aOdWLIPq+Y7wSvwuH0EjedkFoh2A6xRi98kj/hNlf9cQQg7XJ8xx17NpHbQYGVapBiF
	8ZKds=
X-Gm-Gg: AYBFou1sOEdDf1emy2uWCYV40G/sB5dqJkiPVOoaePjwMN7Km+YvCFbKlhyyFt7tIFd
	DeRzwSJvbB94qquYDPucHB3L0wPlgwBnOuxasAxAeFxCzbjALxjw54VjPegvE0HTrSfIE7Fq5AO
	wyK3fszELi/cL8Utzd81VHhL0Sx3gH5VgaoRf/eIBWPHe3EgLLoLKoSseQjUUsDzGoxVPeaTjB+
	zRgt5GoQpYmPVq6nKXn6rd0WxwG8j0bwd9vdcpDBYEGMiw0b6SbXGtj8ahvoje7Hv8z2QYgMPJh
	xTadCCyAVAVuJdDvOtGRR7kgIpVeoRhNBC1yPuTJiYilHrifP4iovUk1STV/o9cFvViSYKePb4D
	Dbr70NaAomTblH8FxqXtaYW2qn73kfQJnjTkctqwpRNNm4Jy5E38xEcUAHb3EfKd2agFdh1G/Rb
	SY
X-Received: by 2002:a05:701b:21c3:b0:1b3:a8a3:c6de with SMTP id a92af1059eb24-1b50306c4e1mr1737393c88.5.1794553646667;
        Thu, 12 Nov 2026 23:07:26 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:1b3:a8a3:c6de with SMTP id a92af1059eb24-1b50306c4e1mr1737370c88.5.1794553645916;
        Thu, 12 Nov 2026 23:07:25 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm5127450c88.14.2026.11.12.23.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:07:25 -0800 (PST)
Date: Fri, 13 Nov 2026 12:37:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH 1/8] remoteproc: qcom_wcnss: migrate to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113070720.f6nj2vqe3rjq6z5r@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-2-mukesh.ojha@oss.qualcomm.com>
 <20260926155932.D28DD1F000FF@smtp.kernel.org>
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
In-Reply-To: <20260926155932.D28DD1F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6b72f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=dhegyi-ghjiyvhX7xUEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: gv7IlINkjN3QF_8100WB7aTRFIR-OlJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyOCBTYWx0ZWRfX1iGdg7znEudc
 LvThoyrQgiWJs6hW9BRRnRRM+IgpGJK0Y5GUlm2iXLh0WhcFfOz/ANUooCBPzHMO1VNRMgBEB/p
 Qdi2dVlRA5qcLjaKkfZfy3UwcuFXRXqWeuJv3GzSROjNgN6SJ1xQcWTsck45sEC2e1mK9XvSaAw
 2u+JD5W/MOHaQWAQsCUH/kiYlhdTJES/0ci2T7xLULgJYTqRU0ec7Fsxw0zs553Un4QAL2VFqxE
 2ILGW/yKBayWwqzkOCu/9NEmCKLUYVePzr3YZrZ5H5Ib8j+U7C89IIFbOu1Wuoj+rt9BSpkYa6q
 LbG30fA7CPYK0KlFjEu6u1Ga9iYFvxgMBL0/nsq6un8X852FprPGxMwQVstoxb4w+gnWp15pRV1
 vUg+zrLagdnZcX11LN6PESHifFYK3FkfTGuFDsRPZaWqjPS+4EoQEY5r5EOK+fgQ6B9QuQhmB3k
 ZA273H2Axu0fYnXxXaQ==
X-Proofpoint-ORIG-GUID: gv7IlINkjN3QF_8100WB7aTRFIR-OlJW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyOCBTYWx0ZWRfX5V0g3gT4bQjN
 iRn3Zf8p3opLH5l97D+/mmQlqlRaQ5c7BOkykluQsLWgww1nW1wvIdKkjoFXVaj2+bsltGBSlI7
 Hqkp3gh1clQIF9lO4qe24Uw6CLyLUbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130028

On Sat, Sep 26, 2026 at 03:59:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] remoteproc: qcom_wcnss: DMA memory leak of metadata in wcnss_load()
> - [High] remoteproc: qcom_wcnss: missing pas_ctx->use_tzmem = true prevents required shmbridge creation
> --
> 
> commit 77b1a378f038e55ff2a11032d9b6f243214fbb7f
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Date:   Fri Sep 25 15:57:30 2026 +0000
> 
>     remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit migrates the Qualcomm WCNSS remoteproc driver to use 
> qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset(). It allocates a 
> PAS context during probe to support TrustZone authentication with shmbridge 
> preparation.
> 
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> > index c856a92af43ce..01f9076aa0b17 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> 
> [ ... ]
> 
> > @@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
> >  	struct qcom_wcnss *wcnss = rproc->priv;
> >  	int ret;
> >  
> > -	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> > -			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
> > -			    wcnss->mem_size, &wcnss->mem_reloc);
> > +	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
> 
> [Severity: High]
> Does this introduce a DMA memory leak of the metadata buffer?
> 
> By passing wcnss->pas_ctx to qcom_mdt_pas_load(), the allocated metadata
> buffer is retained in wcnss->pas_ctx->ptr. In the previous qcom_mdt_load()
> implementation, passing a NULL context signaled the backend to free the
> buffer immediately.
> 
> Since the remoteproc operations structure (wcnss_ops) lacks an .unprepare
> hook, there doesn't seem to be a corresponding call to
> qcom_pas_metadata_release(wcnss->pas_ctx) when the device is shut down.
> 
> Will this persistently leak DMA memory each time the remoteproc is started
> and stopped via sysfs?

As mentioned in the cover letter, this series has the dependency "firmware:
qcom: pas: Make MDT buffer retention explicit" and as the change is already
picked, this issue cannot occur and the buffer is freed immediately now as
well.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf


> 
> >  	if (ret)
> >  		return ret;
> 
> [ ... ]
> 
> > @@ -600,6 +599,11 @@ static int wcnss_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
> > +						     wcnss->mem_phys, wcnss->mem_size);
> 
> [Severity: High]
> The commit message explicitly states the goal is to include the shmbridge
> prepare step required before TrustZone authentication. However, does this
> actually enable the shmbridge?

> 
> The newly allocated wcnss->pas_ctx is zero-initialized by
> devm_qcom_pas_context_alloc(), so pas_ctx->use_tzmem defaults to false. When
> use_tzmem is false, qcom_scm_pas_prepare_and_auth_reset() explicitly skips
> creating the shmbridge and falls back to the legacy behavior.
> 
> Should wcnss->pas_ctx->use_tzmem be set to true here to fulfill the stated
> security objective?

No, it is correct. No change to use_tzmem is required; it should remain
false. Perhaps the commit description needs to be updated to convey the
no-functional-change behavior.

> 
> > +	if (IS_ERR(wcnss->pas_ctx))
> > +		return PTR_ERR(wcnss->pas_ctx);
> > +
> >  	wcnss->pmu_cfg = mmio + data->pmu_offset;
> >  	wcnss->spare_out = mmio + data->spare_offset;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com?part=1

-- 
-Mukesh Ojha
