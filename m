Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF751429827
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949710; cv=none; b=Q4m68D1d+1fu231d+Qm2uBhJG3Pu1d6BXdp0t1xwngIQ1s2wRYTfOle6+7snCmDSv7sjczN8mAFa8idXpZomVZU+z6NiDPj0wrB3sXWNIdCD48mAMyvMjksbwGWLkoRy3XNDeDZ+lVKzBrWU60RHvvZh+1Zh+6OLMlaukxLcQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949710; c=relaxed/simple;
	bh=ODMdvDY3dHNEVGcU+TpThwnD1sq8fG98yVoHBy6zJd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcVumgl5vw1xyyiEjRkxGvVG361n14lqSsoqhwZ+qmZgRlur5q7Y55OEPyF4Roq4/1YX8Aioq2pK2wY+RtepyBLxM0oLLlA088+OoY6Vdz/TR+efb+heETW/2TL4YH7nx00JlujjJB5Z1UDVCaLMCDpiTlHtzLjLf51wIaOnwAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=QG44ze1B; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="QG44ze1B"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeba09900bso2435322e87.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783949705; x=1784554505; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SliLKtP787sX870Cskw0AHEsWHrRbdp92vmeZ+8WbMk=;
        b=QG44ze1BrKpYblpTZBYQqUlL2JrbfFpsLxYo9aJJpK8olFPC3cV29cN7F9xFLPxbNL
         Hk3YqxpgWxPS02BuUc5M+l8JiUT6mAhj1xEvp1gleLoRuG+v9L+N5FBbcILNwTwkofzG
         SQZTsdO9Y+WoioqsjC/NNz8S/7fHFhjUfhacOPUi+oykUp2FkSw7Qb446Ed1afflb6TD
         xjc6WJFv5enop8upv5QMywOz/uX2SzuOBkiptSUiHSzS4PEohkKiHEC2C6bsG9sI6O84
         QIcaV+SKf8Tc9XuAhWv9b/q08HZIo05r4hPhXkZDcNRspczfiY4bE0LNAhM+BP0iAwW8
         tnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949705; x=1784554505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SliLKtP787sX870Cskw0AHEsWHrRbdp92vmeZ+8WbMk=;
        b=gqtMrEdUhpJnXZMDNIkGKH0V4+/Pc+B3aaAESp7VGmeevL7It5WqgYGb8fO1TXWyUU
         UuyQAnqT2QC/d81Ami3bHW6uVGvyrD+7+NrD2ULb3qkz17x/t5mGL7Luyv6LakhMHHQW
         sEIKKpqzEV9FkGupqaSc2ff71TaErO85/JtipNuCDxz6FW0vRnnMtlV78QLMOFIO/FGN
         021CKgyfz+gVRJP6bSwr/EBXdwy4W9WdQV7iXJpNV2PtwooS0naBuyj0gDvEBKn6WBhM
         EiIuxtyejh0BhrhuWHt6qG4krHhe/Jal4mZjw3rcoJC/xV/78OuLvgbD/1aD+KNVTBpO
         y1dw==
X-Gm-Message-State: AOJu0Ywk7tu6NpbkyL1SRXaewnfxbVFiwwo57PI8erBJKX7K9dP03Qpi
	PCJR7DnS4D9UepQ3NGE/YHcm2ZK4t1PicYBkZxj+4ia+uEe0iKw1WHg+GJow35ePNMQy/lpjD8x
	xSssz
X-Gm-Gg: AfdE7cmmyp7bT4KrzxGt0SmJqcxNIsrv3k3AUXlJ9zMcY3TdtdcAO/4n1ARBTuh63IP
	X0t0rykP6jlCZWtP+rVsIVnvFWb2gTMhO/nAlsUdCazg972XArsQqVpefmFmWYMfYswVJNHeggI
	SDCRxiC0zpCaM+Cw0wlWToPFaFUk0oCitEiDvZXCaYe2PH4vZ+5ENOLXZoQt+0/3GyhNgqqM3m8
	mRnUMC/XSlg1+aZLX1w1FVi+kunYw9DpS/z1RABCVcTIVIMODYuvHpylpSvspdGSuYNL7sUv+j+
	OXEJxT9H/+BgqxtzRQ52t95JsqoNiRQUkVxCZQLRH/dq+EAHlQl18Az03OdpGwiApptwez0AktA
	taj8R79tSb1SbC7fBoEMp8ofw89QEsPYzogyGVa0ASpTg2dnpTr2i7uoh+ECiLgFmWr0ymGit6x
	w+0h6rUoAVl6MWQu7i3NUP/Q==
X-Received: by 2002:a05:6512:6699:10b0:5ae:c27b:f7a0 with SMTP id 2adb3069b0e04-5b023561439mr1182547e87.11.1783949704595;
        Mon, 13 Jul 2026 06:35:04 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a287sm2920463e87.3.2026.07.13.06.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:35:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:35:00 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Vasily Gorbik <gor@linux.ibm.com>, tj@kernel.org, mkoutny@suse.com, 
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, hannes@cmpxchg.org
Subject: Re: [PATCH rdma-next 13/13] RDMA/selftests: Add rxe_netns_names test
Message-ID: <alTpYrmPI_fWz3me@FV6GYCPJ69>
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-14-jiri@resnulli.us>
 <20260710095632.8F8A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710095632.8F8A41F000E9@smtp.kernel.org>

Fri, Jul 10, 2026 at 11:56:31AM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>- [Medium] The test script declares a test plan of 7 tests, but only contains logic to execute 6 tests, causing the script to unconditionally fail.
>- [Medium] The test `TEST_SAME_NETNS_DUP_RENAME` attempts to rename a non-existent device, causing the test to pass for the wrong reason and failing to verify duplicate name rejection.
>--
>
>--- Patch [13]: [PATCH rdma-next 13/13] RDMA/selftests: Add rxe_netns_names test ---
>commit abd8a5c3d2f106017be1f5b869afa69da9c27f3a
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/selftests: Add rxe_netns_names test
>
>This commit adds a kselftest script that exercises per-netns RDMA device
>naming with RXE. It covers duplicate names across namespaces, move conflict
>handling, move-with-rename, and same-namespace rename requests.
>
>> diff --git a/tools/testing/selftests/rdma/rxe_netns_names.sh b/tools/testing/selftests/rdma/rxe_netns_names.sh
>> new file mode 100755
>> index 0000000000000..a7e57706fdff7
>> --- /dev/null
>> +++ b/tools/testing/selftests/rdma/rxe_netns_names.sh
>
>[ ... ]
>
>> +setup || fail "failed to create net namespaces"
>> +
>> +ktap_print_header
>> +ktap_set_plan 7
>
>[Severity: Medium]
>Does this plan count match the number of tests executed? It looks like the
>script only runs 6 tests, which would cause the test suite to unconditionally
>fail during ktap_finished due to a missing test.

Fixed.


>
>> +
>> +if setup_devs &&
>
>[ ... ]
>
>> +if ! setup_devs; then
>> +	ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
>> +elif rdma dev set "$RXE_A" name "$RXE_SAME" &&
>> +     rdma dev set "$RXE_B" name "$RXE_NEW"; then
>> +	if rdma dev set "$RXE_A" name "$RXE_NEW" >/dev/null 2>&1; then
>
>[Severity: Medium]
>Will this command fail because of a duplicate name, or because the device
>is missing? 
>
>The device originally named RXE_A was just renamed to RXE_SAME in the previous
>condition. If we attempt to rename RXE_A again here, the command fails due to
>the device not being found, which seems to cause the test to pass for the
>wrong reason instead of properly verifying duplicate name rejection.


Fixed.


>
>> +		ktap_test_fail "$TEST_SAME_NETNS_DUP_RENAME"
>> +	elif rdma_dev_exists "" "$RXE_SAME" &&
>> +	     rdma_dev_exists "" "$RXE_NEW"; then
>> +		ktap_test_pass "$TEST_SAME_NETNS_DUP_RENAME"
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260709095532.855647-1-jiri@resnulli.us?part=13
