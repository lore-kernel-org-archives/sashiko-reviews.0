Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555576;
	b=IzJ+QHpiETWJIx3Agq2OYziyU4mTL4C+MW4Zol8/JECORIcqDgIbi8iSHrH7+aiIfdD0
	 kpr8OZjqC6tRt+sRXYZ2CGsFxYMaHpWciGCDxADRR+M+049gZPD38e6TrutLB8Q8LBmCm
	 QaFajnrRwZTCi+FjmA/0LkSEuTPWN2p+TGhlScr2pytBxvAp0XB/q/cxYl04Orcys8Fh3
	 hyNFyJ6sUd8Re8rHn2QuSPvhlpET3z8BPEAHi66POzEzqTwAu837N8Fj3y929i00Y/85T
	 NURLjLphLLTtE8bcRXkPal2tOh5WWyU4NbZl256LQ6+N4wYVpsrCYwp5ELFl7JjuHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dQubeiySwp0kQI+mmdG+WIY7hmszt1niI8//v/h0yY=;
	b=DbKaNusZ6nSzGuJnrFqu3Tk8QZrBlmV6pZyPM1Sq0KcdzW/UYQCM9EzcuLXm8cWRpWH/
	 MWsFH7YdaK1tVSh8j3jb5VGIxwWnOoroiCu3ek2HAgWOasF4WpWSvdD2iGyGgYvb1Cnd3
	 o72fd5fhWwCopGfN56KJUqnkg7IeCyARctqQLyVrTsfRmu5aLsvwcy8zoNilwj6W9v9Kq
	 2tfa/Cs6FFytl4Dlbw6dxuFI6Moi9Ex2S10EDykkmkYOId9D9Jgxk0AnjBrTl1slLvEvi
	 WCpw6nO4zXXNI/UAXptUtpH4yveiKL3gCdeJBwQDxN/BZZW539uPId1s51R/9PzCx+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiOotXiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djcaFdlD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B272606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B272606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiOotXiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djcaFdlD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD571qn367193
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dQubeiySwp0kQI+mmdG+WIY7hmszt1niI8//v/h0yY=; b=fiOotXiPqQBXd2/n
	orpm30WVRtQ6Z0MwVagdoemvl1COtqj2n1ymivekPAGEfBV7uYNWzUHcA0gr7QOV
	/Mk1hoBKMONHttX+MvUSgVh4o9hhC180lJakIX4BcSKl4KpM2cdl3LSm72mFepOe
	I68KGG8uvdbULrYJyiLrws+mzsYnBH1bHhPq+b9Xq5lkINKlEy+ystNDwL7HBN11
	xWNZ3AU0QA0m9tBa7iU9sXndm5KD/4vRqnymZhXChsd2wQbuPnAiOjeqF7pAkSib
	rZllWFEwYFYQQZwcZl5k6liXxmnhfNU/ITen/t9F/9wYlwwQpEvL032uMbcYP28d
	d3KhLA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx342np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:39:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso1966414c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 23:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555574; x=1795160374; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dQubeiySwp0kQI+mmdG+WIY7hmszt1niI8//v/h0yY=;
        b=djcaFdlD9vpPC2c6qGmBq7nMKCNtTNIpEAB4v0v557srA2S8qu3qWMzUedomcL2Y8k
         8NYJqGvOCvlPfPnTX677bL7bXGlPueAhl65s2xf97o9g1ayovHyAS8XilN2F7k/3Vwbh
         loB3JiQcG9YktWwTHEdAV9tEn1nMtiLT21wqlzyoEBMLTPVAmKBgBr5ipCRZ2U0gC/Nc
         1Dt7paoIJibnEdwUAOqXwMaIEe4JISzPCOiTEQmFGoxLUSymu+QIHsFB5Otu6yAJhjUV
         74w5h5PMH9A45mdqX/71a0bXM/SOJ1hjX6uMwg4N3v3E7MmBPFnu9sOceVltZx9FWW1I
         016g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555574; x=1795160374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8dQubeiySwp0kQI+mmdG+WIY7hmszt1niI8//v/h0yY=;
        b=AQtJ3mVIVvK6vYpC+4R3ntJCKNR5iaSvr7MKb4RyQoLD8tp9siToYr+TQ2ft/7lFa4
         0lmDKljiH4+l5lUmlpmWsxYBlt4twR2UXuh6X8rGCmusv3yMe0taij16gAaPDZO/VUuj
         chlm32ok/fMi1aOAqKliUGtFTdwgDp8jqfQBFfuP1LiNlJneK8tfw0Qi9I/qBYJtP/7m
         LXLeF5E23eut8e2gObe2lU80ZP4dDxaYtG7Hq69FFUUn5Hheg/uswFvqyWAyXPVilx/q
         ovrYAI0A/YNGojy9pXaI1CCjR/MnYMEzJNj38uOtMFn0TAiIdwSqL1T96sb/r6yzDeGW
         yLGw==
X-Gm-Message-State: APuU4Z8wTWosUc1XMCdA9IgPBuuh//OdtWa4qRuA8ar35jljCMaTrqy8
	PJDuuT8AINyJJSIc/nZOnX2NWcn01+t9wm9O+zNCz0oGZnPxDxbKKJVf/tkrul5P7rxgNBew8wX
	vL7w4UD08j3jGgUkAMSsN8b5rEogz0764gBFroYCVaH2y/HACcFZI6MfHZMxtS/rXrZyDBAYOKU
	NWMXE=
X-Gm-Gg: AYBFou0hHy0FpEvVX19yxFAmaTkGLVQ0CZV1dzX6dQLg8vpWDfKLjBDjKIJHjVAktsY
	rFClNMUjv5+ZKxya0KFqjvLE+8gQYJln1u0KCSyN1lOm15Tig3oG3ZOV/gNfcUSreK1vGKriIaA
	Terym2VbmJHv1wWWeYCHN9PE25D3IIyUb/BAerRuGFffWjBpjriYCrxDfH5IjV4J4lJVb6erkJG
	tAbvNPrmM4Oug26PFp1BPgY/LN8cM2ZSNHtQGMF/OuzOA6OCWoii0RwQ/mf8URZQ3sR1zXORpPU
	3wcCdym5IsUUh9uMLh9Dc1sXiHbvjOIltx/kFt/52GaJduN1GM/1gOPcOuu4G9O2qXaZEIpw0za
	3BJsiMMpj4ExhgTcoEbxK4oFyXn8E7uCw4Q/KzhbfgL0C7dhuq0ru1nJMTZshE50vhXC0/sJ2+R
	E0
X-Received: by 2002:a05:701b:454a:20b0:194:3a84:e67a with SMTP id a92af1059eb24-1b503146625mr2003718c88.41.1794555573853;
        Thu, 12 Nov 2026 23:39:33 -0800 (PST)
X-Received: by 2002:a05:701b:454a:20b0:194:3a84:e67a with SMTP id a92af1059eb24-1b503146625mr2003693c88.41.1794555573106;
        Thu, 12 Nov 2026 23:39:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm4776197c88.15.2026.11.12.23.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:39:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:09:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH 3/8] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113073927.6lmwcqjlj4h7xr3r@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
 <20260926155935.D7FDD1F000FF@smtp.kernel.org>
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
In-Reply-To: <20260926155935.D7FDD1F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6beb6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=MUQbuDeSX6FSj05hh9YA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX2Oaf2CE9QlHf
 Vil9OChwIna+XJyB3Tt5IfSW3eMJdn1UkMEsWlCjoI+QWU2bU6Y94g6pvyhPDg1xfje6UTKCfYf
 W3kQoiipftlNOhE3lqd98ieHoa+6RP39tUAdeVdlqMvpI85ubdUTBeXKv2+b4CWkuREzoqjx4p+
 +KccVkgW1vlbOBdjpMS+5dEWRxzUt/6oaR9NA7oHnIIOpE7Z+aESgPmNnoO6WJy9bevqgiyNRTe
 kRcTf9Tlw1AibZvQ0rgZNwJIhkhsmHVe2ZZLDiDXGgweh3o7eNxOh8JWUfcXGeuCixOJh4pvFcU
 /VZjhMrL1mIrk6AxYqvz4g0KoCppdfpqSi8Pn4Njq5fSxWDNmg4OcX+Ay3w03nHirUu4OO/YIqk
 H/AHZImGs70pFgIaRKN1ICWF5DDgioCSQUr7qRjlUBs+7/We+/MZ683jCcWWX6FGS6PtqgGQMj2
 dDW0tTP3qLMmlIIKN+Q==
X-Proofpoint-ORIG-GUID: 1aotvfJD_fmsWfMJgshK_fzBbn3cmW9F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX9Lv94kaB3cop
 9W6wrvBzn5fWq4vvcV7Noi0Ozp++EH1H+lvBYPI5AvAH0d7GcSmMvX4lUB3lyl8eXgY8KvcvgxD
 SFoypzVO4+MOOk1gykiZxid7yPifrzs=
X-Proofpoint-GUID: 1aotvfJD_fmsWfMJgshK_fzBbn3cmW9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130030

On Sat, Sep 26, 2026 at 03:59:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] firmware: qcom: pas: missing qcom_pas_metadata_release() leaks TZ/DMA memory
> - [Medium] devres: memory leak due to repeated devm_qcom_pas_context_alloc() on fw reload
> --
> 
> commit bb3acb8beaa539b1cfa0975914c1f8fd75747e36
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
> init, memory setup, and segment loading with no PAS context, and
> iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
> prepare step required before TrustZone authentication.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 21cdf1c398357..e73a5dd98b88c 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
> > @@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> >  
> >  	fw_size = qcom_mdt_get_size(firmware);
> > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > +	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
> >  		ret = -EINVAL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > -	if (!mem_virt) {
> > -		ret = -ENOMEM;
> > +	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
> > +						    resource_size(&res));
> 
> [Severity: Medium]
> Will this leak device-managed memory when firmware is reloaded?
> 
> If the hardware system error recovery path is triggered (for example,
> iris_sys_error_handler() calls iris_core_deinit() followed by
> iris_core_init() and iris_fw_load()), devm_qcom_pas_context_alloc() is called
> again unconditionally. This overwrites core->pas_ctx without freeing the old
> devres allocation.

Need to find proper place for devm_qcom_pas_context_alloc().. 

> 
> > +	if (IS_ERR(core->pas_ctx)) {
> > +		ret = PTR_ERR(core->pas_ctx);
> > +		core->pas_ctx = NULL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> > -
> > -	memunmap(mem_virt);
> > +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
> 
> [Severity: High]
> Does this sequence leak DMA or TrustZone memory buffers allocated for firmware
> metadata?
> 
> When qcom_mdt_pas_load() is called, the underlying PAS subsystem allocates a
> DMA buffer for the metadata and stores it in the PAS context. The PAS API
> contract dictates that callers must subsequently call
> qcom_pas_metadata_release(core->pas_ctx) to free this memory.
> 
> Looking at iris_fw_load(), this step appears to be completely omitted on both
> success and error paths before the function returns. Because the DMA
> allocation is tied to the SCM device (not devres-managed for the iris
> driver), repeated firmware loads due to probe/unbind cycles or hardware
> errors could permanently exhaust restricted DMA or secure memory pools.

After this
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf
the buffer is freed immediately in the call to qcom_mdt_pas_load(), similar
to earlier behavior.

> 
> >  err_release_fw:
> >  	release_firmware(firmware);
> >  
> > @@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> > +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> >  		return ret;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com?part=3

-- 
-Mukesh Ojha
