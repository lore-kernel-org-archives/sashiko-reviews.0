Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FF448390
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034206; cv=none; b=abjIMcd6S/TTlISqx9BV0C+FGTw2KR9fjTrFf8ePLxsmOMH7kKl0bEnapIuiQs2BMpkaJ4oxUrn3eoslKUH8/9HISNuItR8w3nhsXKpZQ99kjwdEGdfzPc/eszQzAYpTG8UaiaFU2sx21V432n0xQtvskbMN12LX73ZP7kAAHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034206; c=relaxed/simple;
	bh=rC2Kqe+sU5PqXGlFedUh2OqBv9Iid7OTb3etgq6VA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEQbwKOAAaD9UHpi9CToRllGxf8UZBdVTAtmDD9RriOZTG6KDJcRa1IcHfRHxHP7Q6ICV3YdxOK4fuE6dcgFGW8sNdiUN2F90U2ChZzZkvXA7mrfqFunxELIF8buxODkcDdPGZ6q3sKXE28yj5qUI1ipM0yVA3fpUa8J0YmxmdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhBlq/Sp; arc=none smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhBlq/Sp"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-664dfa166f1so300283d50.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034203; x=1784639003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfSJmEAZPFbCA1isHeIkUteGlC+Qb4lvv34SMSUfW2g=;
        b=IhBlq/SpdRJkctZWMLPAWxuqEyEmp/zThE2Z17AWBnbsk0hYch6jxJOzET5zSWbkeB
         9EjXwnOlNOiZo2Q69TqxffgNnVldcWpTTqSvK/5gFBe7diHiolxePLsWjmr3BcQMp8g3
         T52dwrxQSajR4EhJxOx58GeECsRiEMVgVKY/4JedpcsrIfrF7euYqkhcM1iMaKHrMEtG
         GyIH12LYZxwK75KRCb2eUrMEcm3m+UaulfUTMA9RsgSU7DEMSnRtQvNZrGfrhSQN0iUA
         Ugs9N8rwqAwZ7MRJ0bppNA2hOCvtaGZQbKwRKFzLvqeJvRUtzXv7xQRY8It3xNMRVdFx
         goYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034203; x=1784639003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfSJmEAZPFbCA1isHeIkUteGlC+Qb4lvv34SMSUfW2g=;
        b=rsTAr9eTCxEqArLHnZH5r/mpHRxvBc7AP7ajJt0gHKcukbMy1GNFwlan4o6KScEFNG
         DUZw0P4B7CsU0dp9cUq9iTgfOqorPxdvIS5z76WTGWvC/gVKEKhweZxiN8oy/CXxmUQN
         xMFM/n5WzOnKg0Eg0KQzoNylNkO5DafVta5J04VPcyIZYG7BN3GSvKEwpcSu21RJ/ahS
         16HX/yHLjXLfXzV5X3GFmnmvFZ5muQ18+qd+2eLQcBXeagbBinZxJ3R5U4kECfTIuHOH
         zaRO9JcuxTOx6mZm5JY46ecgxM8KUo+PLvFnWXRmOq/lZo0QWCrHh5lNP6ScZFju5Mbo
         uvOg==
X-Gm-Message-State: AOJu0Yz2anykC1BU6hEn5dU1m94yc/CL8Xxi6KuWMm1asUCS/a9Wp1UT
	XScaRMTVX5txXzyTf84ZYpGR7xsnSv4qlJ2Oac+gwSoxT3u0MdzeQ+V2ZY3COVOXUIU=
X-Gm-Gg: AfdE7cmmmeW7Ex3tXNnHetRKZwbb86Rhf0RsohXKOI/tluYyosId0c45hb1pc8+izeN
	LRbvgFDTCyYV1OctpVcrzBJoHeusQ2Bk6MkY3LzjiqzyorS4mSb6KTeb0+CSChf5V1TZHS0xqsy
	V/CAXT6Pfc/eYQkViV1HQibTWSeTMGHrnVCQJNfHr3aeVuTcMqiCfj02i6dUNnqFAr1QSf4EDAO
	+oaapp0bOVC52dqSidpsFTj9SxoX1H9ZYjxiR+OiXNXDq1n6UGIoBgpZYi6XTAFowk9aWrFWIpI
	JnRUEHqFhJZJ7cyequ7S4sJBahf0gMmso5pjY2QwQswmzMSM7z6ttgietp35cEXOwbWOtlC32b9
	hce+R8Kmx6SlnjW1S0a56bkRrL8ZFoF8Pfni4dG7Qwu24b98IHHGamdZZvsWqRJ3+EBA73l/Krs
	Mjg2tqOSoiMrhjt4Y8ot/cMg==
X-Received: by 2002:a05:622a:1f8f:b0:51c:7b12:5ff1 with SMTP id d75a77b69052e-51cbf3e12bcmr115593901cf.77.1784034121716;
        Tue, 14 Jul 2026 06:02:01 -0700 (PDT)
Received: from [192.168.101.113] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacad0cfsm117138491cf.8.2026.07.14.06.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:02:01 -0700 (PDT)
Message-ID: <4f0c1daa-dbc5-4a3c-8914-253372deec8b@gmail.com>
Date: Tue, 14 Jul 2026 18:01:53 +0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: starfive: Fix unchecked pm_runtime_get_sync() in
 probe
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
References: <20260712175427.232234-1-alitariq45892@gmail.com>
 <20260712180440.423421F000E9@smtp.kernel.org>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20260712180440.423421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/12/26 11:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The driver's removal path incorrectly calls asynchronous pm_runtime_put() before pm_runtime_disable(), and tears down PM references before disabling the hardware.
> - [High] Failure in starfive_pcie_clk_rst_init() returns directly without powering off the PHY, causing a resource leak.
> - [High] Missing return statement after regulator_enable() failure causes a silent fallthrough, later leading to an unbalanced regulator_disable().
> --
> 
> --- Patch [1]: [PATCH] PCI: starfive: Fix unchecked pm_runtime_get_sync() in probe ---
> commit 83a329f8aee98c4aec071468fc96ecc89497124e
> Author: Ali Tariq <alitariq45892@gmail.com>
> 
> PCI: starfive: Fix unchecked pm_runtime_get_sync() in probe
> 
> This patch replaces pm_runtime_get_sync() with pm_runtime_resume_and_get()
> in starfive_pcie_probe() to properly handle runtime resume failures. It
> adds error handling to disable runtime PM and bail out of the probe
> function if the device fails to resume, preventing unbalanced usage
> counters and hardware configuration on an unpowered device.
> 
>> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
>> index 298036c3e7f94..e9a472985b8ac 100644
>> --- a/drivers/pci/controller/plda/pcie-starfive.c
>> +++ b/drivers/pci/controller/plda/pcie-starfive.c
>> @@ -410,7 +410,11 @@ static int starfive_pcie_probe(struct platform_device *pdev)
>>   		return ret;
>>   
>>   	pm_runtime_enable(&pdev->dev);
>> -	pm_runtime_get_sync(&pdev->dev);
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_disable(&pdev->dev);
>> +		return dev_err_probe(dev, ret, "failed to resume device\n");
>> +	}
>>   
>>   	plda->host_ops = &sf_host_ops;
>>   	plda->num_events = PLDA_MAX_EVENT_NUM;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at starfive_pcie_remove():
> 
> drivers/pci/controller/plda/pcie-starfive.c:starfive_pcie_remove() {
>      ...
> 	pm_runtime_put(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> 	plda_pcie_host_deinit(&pcie->plda);
>      ...
> }
> 
> Does this leave the hardware in an active power state upon module unload?
> 
> Since pm_runtime_put() is asynchronous, wouldn't calling pm_runtime_disable()
> immediately afterward risk canceling the idle/suspend work?
> 
> Also, does tearing down the PM reference before stopping the PCIe host
> controller via plda_pcie_host_deinit() reverse the proper teardown order?
> Could this cause the device to power off while still being actively accessed
> by the core?

This is fixed in a separate patch [1].

> [Severity: High]
> This is a pre-existing issue, but I noticed a potential resource leak in
> starfive_pcie_host_init():
> 
> drivers/pci/controller/plda/pcie-starfive.c:starfive_pcie_host_init() {
>      ...
> 	ret = starfive_pcie_enable_phy(dev, pcie);
> 	if (ret)
> 		return ret;

I do not think we need to call starfive_pcie_disable_phy() here inside
the error handling. If starfive_pcie_enable_phy() fails, its internal 
error path already cleans up by calling phy_exit() via the 'err_phy_on' 
label. Calling starfive_pcie_disable_phy() here would cause a redundant, 
unbalanced phy_exit() call.

>      ...
> 	ret = starfive_pcie_clk_rst_init(pcie);
> 	if (ret)
> 		return ret;
>      ...
> }
> 
> If starfive_pcie_clk_rst_init() fails, it returns the error code directly.
> Does this fail to clean up the successfully initialized PHY?
> 

This is fixed in a separate patch [2].

> [Severity: High]
> This is a pre-existing issue, but does this code swallow the regulator error?
> 
> drivers/pci/controller/plda/pcie-starfive.c:starfive_pcie_host_init() {
>      ...
> 	if (pcie->vpcie3v3) {
> 		ret = regulator_enable(pcie->vpcie3v3);
> 		if (ret)
> 			dev_err_probe(dev, ret, "failed to enable vpcie3v3 regulator\n");
> 	}
>      ...
> }
> 
> Because there is no return statement after dev_err_probe(), the function
> proceeds and eventually returns success at the end. Could this cause the
> driver to continue operating with unpowered hardware?
> 
> Later on, starfive_pcie_host_deinit() unconditionally calls
> regulator_disable(). Since the regulator was not successfully enabled,
> would this trigger an unbalanced disable warning in the regulator core and
> corrupt regulator use counts?
> 

This is also fixed in a separate patch [2].

[1] 
https://lore.kernel.org/linux-pci/20260713145014.740898-1-alitariq45892@gmail.com/T/#u
[2] 
https://lore.kernel.org/linux-pci/20260714113029.326207-1-alitariq45892@gmail.com/T/#u

