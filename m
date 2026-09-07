Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5C44A3FD
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774223; cv=none; b=Ni9z4V6SqhvbofNUBBWXGehTsrzkeKcEIFjfFFSOaZPNr+IOPubxA6NgNJ3tfHdDMFByemeAjbFFMmp9ShJ6FAsZ7BudjN53pgE3UF4vVgjJurYpgvq4K4lbKg3bH/jExWWgS6BFKZycwPFtw8pylW53SqPy2xP0gb5cT/3mW4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774223; c=relaxed/simple;
	bh=CZ/NYTFdqpahtrp2WCstu+rur2urPhfJWZmLTqcnefU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZE7iU1q0vbTB0womOriVuvtUIzvhN9v2UoeDQN1cXUVMsSEh9It9mIDEvmu0mDHwLds7lRHHeG0d1VBfoyWDmTvsbzookKlKWYlIeb9rL2mTF+c+kkREqUj7S0p5TbnH6aC4WYRkcVldTgnF0S0MKziXGTkNVFl1QRDB9ISGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOpUoWCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXU653Nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOpUoWCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXU653Nx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879boov3702598
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 09:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=; b=DOpUoWCmqyaWMx4L
	n7X/lrwJwasZ34Q7XqNRLv47M7ZyhLgl7IF0PgGZjuVK0SX3216QDFcTbXqoyA6v
	9f1g98WW+yoUlU2k9ehwmLMBdONwmkbVAeK0U1bCnO9Ubz9py2jvxqvmhMfuWxTR
	+7nfG9DlRToBLQ56a1GoTkIaDyoE6WEYpvMdQOx2Cm8SV4haEuithY3Qe5IFOU0b
	NLFgZWhCZ7wQqSVA2J293x9qhp2AXP7lPPFTNDCcBcKD2WEq9iQvuMCmd/Uvmqkg
	xrS7DDq5c7FyIIpoiKFaqeY2SZ80MOMcwwFW5dRXDiry2gtjK230WMm8WnlfAwqe
	tvy76g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66h5hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 09:43:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so629586385a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774220; x=1789379020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=;
        b=hXU653Nxapadn2RyCi69MOJVhl9db2DBY8QWCvyVyZ3Li4I4OKbNf9wztwbYbss1YG
         6kw1eJ066esxQXDOcW6D6cVKIW71qoJ6N7wH+Z5lWbxeTGPmARWmggCA+jmU9j88Mhky
         y/Amu2T5uGocXWZqKM5+SGky/7d5gKTl2iW8pH4i9JCiwqKDhNmcj5GNtus+pjlDqYN5
         8nRuR6ejM/KjYqAR47Ne/mdwtCivJxb9Bqk3F8AaiuyWT364sHACgP8hxQD+m1f4DBhR
         Ifb9nb2Qkds+xVpQRzPxm4ycOyECbAahXtsUJi11E+HWrCAX8cALGTaQxOb6/kQdQgyi
         FOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774220; x=1789379020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=;
        b=QfqX55Y3EQyjXQfJKrPPWcy0UU2NA0QbGesEPqYJkgyByPIVbCm/ZuHsS3EAZbetEV
         otBNG1S8UHKY4zr3gDJfdc5+cbycefKvZFTYMza8K0tft4+VXky3gqLg7rh9gSAFpiPk
         JITWmHr/N0DCpkd7wHki2YApJoCMvulUBhS9RBiderKqE8dZjb7dDQKPmn9FRIQ86gxt
         qsaH7KVRDGASVxenj7iRyh1XGXAAQ3tSCdNW7xwZSTMcNmllot0YTO0x2STkExkWJdxK
         i1jRwJ4DiX6mfsolV+gEDjvA7bNnxOqeVrYG1r1YA9JNik2D7QffIk3ylROytDm049xe
         fCsA==
X-Gm-Message-State: AFuF++lCXlOr7R6a+weYf6SgEQhBiKNxyqQNiVeKPjPR7pY77xwja/CZ
	xry9YTVprj/P+TeCoKmqF7pjbPJ7lnmH8VZ5tdM2rE2g41NMdJY0tAzFpTJSww0gDfcNZP+5Sbp
	KoOBFxJyQqZBiA4BYtDpDnE6kkN3zRmXxMDtNFW8h1a7+adnhf7XnYX94QHa6EFKnz5kHFbMfxA
	QXsnQ=
X-Gm-Gg: AYBFou3wtqeabiV0ld6oBtHoUX9IB9jH9SiKnOIEwCtcwOEWe0yJ0nzQ1bQ/+ZzfwzG
	NBDph/tHCVIdzhOH6uAQ8XDzxVs6td4QwlQ+Yq8M9usSJvBRFWADavFAqfPswBsvcIBqzf4+tJM
	shh74NTNvmh4o+3rLjXt3IaLRMgVIWxzQhFmz4R7tYJnH50MRyQB8zkqIofJcAwSssqKJOKVDr2
	O3JHe+rq0shEzXAe/t/cFuMD1k8cb/H83oijlzfKFNDZ34Is7kN/NsyHIMDkV7Mr+Hul1TcfZvs
	3Qh3yj0Gg86zJICFVfvJ5WbKRYwLjiRKsFDMifDt11kb4neM/xlBL9N3BwbpD9ybLOwek/F/EY8
	RnEeHjU+lsj5dsr1qdbZlVDWRvD0=
X-Received: by 2002:a05:620a:3f0a:b0:934:9639:3a4 with SMTP id af79cd13be357-939804af893mr1693139885a.41.1788774220348;
        Mon, 07 Sep 2026 02:43:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3f0a:b0:934:9639:3a4 with SMTP id af79cd13be357-939804af893mr1693137785a.41.1788774219875;
        Mon, 07 Sep 2026 02:43:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm29438245f8f.10.2026.09.07.02.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:43:39 -0700 (PDT)
Message-ID: <6eb266c3-b1f9-4f4b-8aaa-7805987548a6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:43:38 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260907085028.110551F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260907085028.110551F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e874d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eV98kISo5-x9oh8RimYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JKYq8ViFow39HjFdoWFIpM0Eoe04nL-A
X-Proofpoint-ORIG-GUID: JKYq8ViFow39HjFdoWFIpM0Eoe04nL-A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfXxH0Xj92plpk8
 YpAda6rwZz0MYTpynKvNPiiGz8ctSmhYuyVLYuXoMjo3hDNDKDe8I7E5NOwH9Wn67BBmetsG8GO
 kMX309otTf1rEp5ALuDRnV8V9/aSX+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfXymu/G+N6YegY
 LSb8dDNxhOC+Un1jrJ22r/CqkI/Ci5ek7wZYYHUSu3FdRmEVe9wMGpbK+gpVxXtZq8bL9w3otti
 SIvKIGpBTA+6krGN7E+TTiqI9GfGTipXoIBgsVAo9QGvq9O3G+BpImxZEMlLn1v9++Myo7UAtId
 0tSDpC7uYYUnuMyqFo9TBcEB4dcen4OlQ07JYneA7+KIygYCE5h2p0BObVqo1bEpOTdu0hnAU9D
 1r5J0rSSXIf5bt6wRBO7/pxNx6cSaYQ8tMFibmo5WLx8UNMZRs2b73uk53sBuYDeE9M1b+i+KV8
 YdLhZjrA1uvuZ7wHsGMdj5jbmA2g6OCShePSiYQhdrqlaGzM2QeaPz0tH9HQxycSt4ip3jwbcCj
 xWsgPoZL1HwLsqAc57SPp+1rPt8TV85xb3UIuV11UTM4xnHeHCTYNiwpItk5g46UMPkpTyVG+83
 skBpF1lsC6gTAj5jeHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070106

On 9/7/26 9:50 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] Exporting `sdca_class_pm_ops` unconditionally with `RUNTIME_PM_OPS` causes dead code retention when CONFIG_PM is disabled.
> 
> Pre-existing issues:
> - [High] Data race and invalid hardware access between `boot_work` and system suspend.
> --
> 
> commit 0f2e2cef51e8b87316164c383139022824389918
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: export PM helpers keyed on sdca_class_drv
> 
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot. That works for the
> generic case but blocks codec drivers that want to embed sdca_class_drv
> in their own private struct. Split the four callbacks into exported
> helpers that take a struct sdca_class_drv * directly.
> 
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index d7444f442c71c..88a29116a334e 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
> [ ... ]
>> -static int class_suspend(struct device *dev)
>> +/**
>> + * sdca_class_system_suspend - SDCA class system suspend helper
>> + * @drv: caller-owned sdca_class_drv.
>> + *
>> + * Codec drivers compose this into their own dev_pm_ops.  Disables the
>> + * SoundWire interrupt and forces runtime suspend of the underlying
>> + * class regmap.
>> + */
>> +int sdca_class_system_suspend(struct sdca_class_drv *drv)
>>  {
>> -	struct sdca_class_drv *drv = dev_get_drvdata(dev);
>>  	int ret;
>>  
>>  	disable_irq(drv->sdw->irq);
>>  
>> -	ret = pm_runtime_force_suspend(dev);
>> +	ret = pm_runtime_force_suspend(drv->dev);
>>  	if (ret) {
>> -		dev_err(dev, "failed to force suspend: %d\n", ret);
>> +		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
> 
> [Severity: High]
> This is a pre-existing issue, but does sdca_class_system_suspend() fail to
> serialize against boot_work?
> 
> Because boot_work is queued on system_long_wq (an unbounded, non-freezable
> workqueue), it can race with system suspend. If the system initiates suspend
> while boot_work is waiting in sdw_slave_wait_for_init(),
> sdca_class_system_suspend() will force the device into a suspended state by
> disabling interrupts and setting regcache_cache_only(true).
> 
> Since sdca_class_system_suspend() does not flush or cancel the pending
> initialization work, boot_work will eventually resume, blindly set
> regcache_cache_only(false), and attempt hardware access on a physically
> suspended bus, which could lead to bus timeouts or crashes.

This is existing issue, it should not be necessary for Tambora support
series to address these issue.

> 
> [ ... ]
>> +static int class_pm_runtime_resume(struct device *dev)
>> +{
>> +	return sdca_class_runtime_resume(dev_get_drvdata(dev));
>> +}
>>  
>> -static const struct dev_pm_ops class_pm_ops = {
>> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
>> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
>> +const struct dev_pm_ops sdca_class_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
>> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>>  };
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");
> 
> [Severity: Low]
> Does exporting sdca_class_pm_ops unconditionally with RUNTIME_PM_OPS cause
> dead code retention when CONFIG_PM is disabled?
> 
> When CONFIG_PM is disabled, runtime PM callbacks are never used and should be
> eliminated by the compiler. Because sdca_class_pm_ops is globally exported in
Yes, compiler should strip of the static unused functions.

> this patch and populated using the unconditional RUNTIME_PM_OPS macro instead
> of conditionally-compiled macros, the compiler will retain the structure and
> its referenced static functions (class_pm_runtime_suspend and
> class_pm_runtime_resume) as dead code in the final binary.
> 

