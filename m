Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12136F91E
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641302; cv=none; b=tN+g2nYQXgfLhfl2vmNN+26+09HFmJCYEJcA5jFI1hx2j8I0KBWhUaQuBIvE7bNXqrJueo0mHM7VhTT2fxiqDnvuYxJ8zEUGLZtlrDJoFImtUtlusyT17p8EpjMvaQ0tx2ylt4HymzeZK3+N4s5YZJQb2SJn/WbpAnqqqBl6fWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641302; c=relaxed/simple;
	bh=Lvcl3CRfeVXVAFghv3svpdGw2qc7DCUrpgugO4Rld+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZslFq+3v102Hkmkv5IKCs+eniLUvuAxUxz2vktJZ4Zbkfbd9o+BW80XaT3Gz6bKwtS4Dw6SQrlSVeuLTqeEo6MrqgH83XOYtmbx7ctRdOVS1trXDy4cB84Dquo3BZ9SlrO2YqpX9Y/RdVMvcVJxl9VhdfkXxo1Nwh/zO+O0AvIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIOpLeQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhUMGcfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIOpLeQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhUMGcfz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLsAY2023793
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 13:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4E2eWDKLcnSPoYw7vDjCZz9
	5PSBT94/QtIXEfEoZP4=; b=XIOpLeQUBLN1jHSc3o8d4n2p8dbHRRcsZ2CL5Se1
	Yg0ZCP7vik8xr/PBR5e8+E61kbHwgRONOJNvwdiCsgW+RyWeSZJRv7WPOZIi+pJy
	aeHfNn50ey3dSDLSpg+SqmDrZs+rsSlrpJoyQBY5abLp53dj8FWTA93EmKfeCHlp
	d6TOitrkkM332gnzgL0ZhjQKvrFvEIwpFW5ojD0Ygh4ymXHgV0o5R1J6irtCuTaL
	fvTyoXEkXKCU2kR5mgahbPQIm/QaXDas81igVRaJqmXr/T6NmL78BOUIoFF0gx6H
	zgeY6TQ0TJWoSB/gjnHjl/Eltnv2f7m68734N/ElRqRWjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gyns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 13:41:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so176219851cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641299; x=1785246099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4E2eWDKLcnSPoYw7vDjCZz95PSBT94/QtIXEfEoZP4=;
        b=FhUMGcfzGvrBKOHR23nFZzv7cIRqx2iaJYe0IOfuSZq1v18N/TJenfoFgRwYqtAnuB
         g1k1Sw053XayrIVFNj3i00RLf+w/gObzfC2aQcE79JgkvOs6VH1DWEsjKQycmonJ9V90
         PDUDbA4lTAhtyPcfEsRnutQ2dvN2bG7zPUGjVLZfcnRx0h+6RK1A7SSPke23pD9gY+9V
         x1wXw6sHWd+sitP5493vSPcJA8vTFpCfKebz0rr3Xve+SoZymd7J8fUFsG8JmMuHLDPN
         q7tw36OKS52JzaULsxH9aX1TzCY6mWdt+Ef2sFpl/3Ny/SVEbAFOoFfhkYGcY+B5Hp3E
         GKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641299; x=1785246099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4E2eWDKLcnSPoYw7vDjCZz95PSBT94/QtIXEfEoZP4=;
        b=HMY5dJxme23E08zqusSt70GKcRSHTBfKikDzSBWLkKB37/h4xM95hd4T/z6jbEK8og
         ReS77TKkGe6iV1GwC+8nO5YOGZub69Vz/8Eo3RjK+BN0h+WNZrKLCqZuTfb93DWPZAaK
         8v1P3Ne5lhfbsw5nEFiO4RFWqiEg/xiI0nTn9Byo1UYTrxkv173q9mTSOdticwBTKCKa
         0xMwaKxz9rB7Ob6WjG5kO5KgmDaZKASw83hqTJMAteXQzSOSuPRtrZ6GKi+Y3HWbOC/L
         0pfuCswtA6oWlT8iMqtTbMkaeefnUJKfHYlrd5Z3FuXVYR7MSpWXoqMk/CM3hSiq09cK
         I7ew==
X-Gm-Message-State: AOJu0Ywh99RM0nE/u52k0Z5tdUJzbyPcizG917h1sb9xMcv7RVcOE0CQ
	AFrU05tLTktoRqfW8uR9HcgeprSqZLo9GGEz05KUuvoIus1B1f47A4srVrmwv4v9x7Mb50vjGfW
	EAP2nyDafSlcMxwKGijDjP3VzNbLBoNYHOy/TehtAYSoI31V2dIvp59/0bdygEeWfoDv16TtiZT
	RbN9Q=
X-Gm-Gg: AfdE7cmVUmw+KnHR5GtVC/Hr9uJ8+eR+zahUojvnXYFc7xtAvh5zVF3AInozmvnhysg
	iutSzIfDN9W91YiGXMEx27vxF3Lzhpome2ioH84cMrWrfs6MX5NkHT/BSBzwvAV6Rx8wWU9gCyj
	JBqEIcPOUbpOQ6oVZgKqNQZdvaGfX90paQPIPXY+Vv7KQHorQYDzuKS8slFyqPEKmB4bYyNNwQt
	+i7ZuclhIx0a0l9rgalFDSTyVwOj/hxaHOuY2vL0ZoRZl1rWt2azZBiRdkpVWtm5/co7ZXZOKAP
	UyYZH76IjStJjdIqfJKJgvuEowQ4MOh2tlTatfSJ7tbHSUOTU+NBqIkuG05aPT9TCrLO8V9rOU5
	CNMoD8Od+7NimqQhoj1s571EOtZ+GW8IBv+ICJxmko8vEU7m7Zn23L+ikhxQCPTjsGkMda8J8Qe
	DXBh3DDBeBUdvEaA==
X-Received: by 2002:a05:622a:118e:b0:519:75f9:e874 with SMTP id d75a77b69052e-5213d2b6d47mr167996731cf.10.1784641254642;
        Tue, 21 Jul 2026 06:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:519:75f9:e874 with SMTP id d75a77b69052e-5213d2b6d47mr167996461cf.10.1784641254232;
        Tue, 21 Jul 2026 06:40:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1949csm2902431e87.65.2026.07.21.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:40:53 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:40:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
References: <20260721-topic-smem_dramc-v4-0-748f992278a3@oss.qualcomm.com>
 <20260721-topic-smem_dramc-v4-2-748f992278a3@oss.qualcomm.com>
 <20260721124005.E00041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721124005.E00041F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX7TDAQYxxjMcU
 3KGA6TC7J5ybOtJqyHNAD5R4Vcx6K4mz+L9qiQtf8O7b0zNt1m6Nwxzk3n2XsDgz0el7bc7j1w9
 0TnMn8vYkPwYNDUgZ3Z3+doqApdqDWXeyBd/PfwKlT0MQJuAAz3wcvL12h3Tz5aem5eN4BZGgKg
 1Dozbrfosgm4YxtR1rT4P0Qxk+j/FgUGvrDL4MHgB7VRRBhJZfVEVdvtBIIvU8zzxO6ptSmpYdQ
 tMnBderDt36zfmQJDq/G6NDDiGSBkzQ+Cmc2aWRm2y8PjnC21ux2h7ngRCOD0lTXAIwEuRzLfsZ
 CSwKOW9+IjkbwKvAnfD22RLqP2ShaalmLGTW81rhBalCN29M/IOXP6vCTE9BBTAOjBboJ4Spi76
 tI6Hv21yPj7lO+JWlzxkHgXSSv+plbB9peR+W0AbJOF1bnizCT6vWJuWGqVObxhCdEpbo+3O7DZ
 TR5n8NJ9ryaygAhG1VQ==
X-Proofpoint-ORIG-GUID: H9DOVZWltojdWUkz84ANoFu5IftxYx8B
X-Proofpoint-GUID: H9DOVZWltojdWUkz84ANoFu5IftxYx8B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0f4EMnXIWaIu
 eXz0oiSTB0bqDcWvwHI2OMJRYwt/xOO3BpfTRoTnII99J0jgQtFk4uzxatrPzEMzGGZQteQJB5t
 9Di7wKwChgKIraV9DHOM5bD2r+g/rY4=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f7714 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=x8C9OYS-9AN7LrXSNBgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

On Tue, Jul 21, 2026 at 12:40:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] A race condition between SMEM probing and `qcom_ubwc_config_get_data()` can cause the driver to bypass probe deferral, incorrectly fall back to default UBWC data, and return mismatched configurations to concurrent callers.
> - [Low] Missing Kconfig dependency on QCOM_SMEM causes linker errors when QCOM_UBWC_CONFIG is selected but QCOM_SMEM is disabled or built as a module.
> --
> 
> > @@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	return data;
> > +	hbb = qcom_smem_dram_get_hbb();
> 
> [Severity: High]
> Can a race condition occur between SMEM probing and this function, causing
> it to bypass probe deferral and use incorrect default data?
> 
> In drivers/soc/qcom/smem.c:qcom_smem_probe(), the global __smem pointer is
> published before the DRAM data is populated:
> 
> drivers/soc/qcom/smem.c:qcom_smem_probe() {
>     ...
>     __smem = smem;
>     ...
>     smem->debugfs_dir = smem_dram_parse(smem->dev);
>     ...
> }
> 
> If a driver calls qcom_ubwc_config_get_data() concurrently during this
> window, qcom_smem_is_available() would return true, but
> qcom_smem_dram_get_hbb() would return -ENODATA because __dram is not
> populated yet.

I think this must be addressed, the DRAM data should be parsed before
setting __semem pointer.


-- 
With best wishes
Dmitry
