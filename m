Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E731326B
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297398; cv=none; b=oriLq8rKChwdUdgOS7z4xwXAJGIKkkFw98E5WhpoK5Le079quPCAPTrRAzaq6pkWMx493DRVrjmCQKcpgdsxu2/VKtJrHI6mkODLurdt71W4xiVuDyd+4c5VPXVmHuBeKPhsR3I6L5wIH939iSI4E7gcMVVpzaTBo+xs6Uz2OGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297398; c=relaxed/simple;
	bh=ZTIYqO8lvntxq7PBA88uJmOyCPtNN+lz3W5n2rnc7uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxiS8lZfEVmwXHH56cUKbEbKZwvQfYbTx2qPk/AsgZLMv7y7KDOkVrB7MbOd2XicVkN4yGKfBNk52b+bqaGy3rHm1YWzj3hDgB4m9V+fVzeGyo4xyp7UUuuqMoIlRLNn6wgbppK04TbRLfgDV8oeGi1xwCqwmKpq/7Vh6ZkFK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=KABvUc8E; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="KABvUc8E"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49548e01d02so4121585e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784297395; x=1784902195; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1PJ2tCrZprO03QzczdHRzzYo8M3sJdRoRBqwRMce6E=;
        b=KABvUc8EBN+Dwqm5JrmCrW+ehw/K4cl4GxSMMMgNMIeFiExCUbx5JRouhcqdXtIt5f
         QGzsSrkAQXets6Aomk/8T3r6xlmyJLg8fNRUqcuiyMyYRKxoV9ImBTVv9yEqUfbTnl3f
         nu6OIhcfk5Rpsuwom06q1AajSuWe1VhU4HWDPjxni7DewHOnP6hqkxSt7p2Euo9eO1OE
         vTtElZWWN4lYC2/vJY/Qje8m46Rpxwgg8pTnlJ72Ffg9m6zBYTFKSNuatk4Ez5QKJkPi
         LinATDAkerWbjglF14/kVqtjxT4eOo/IgJXoAOwL94IbfD3SUYSLPptHGQWm735DTKhQ
         leeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297395; x=1784902195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f1PJ2tCrZprO03QzczdHRzzYo8M3sJdRoRBqwRMce6E=;
        b=WX10rCLcu/S3g4SDO+mxNhqcDiXpyeRaePxieM0KrqaMT7z+M4YcPV+wgMqLjEsxqj
         wM0j8iB/C9ySdUs9IcPy6j6f2SNiuNGDeDYqwuv1zmS/UOcHoKtNcqpwQ+uqSJKqyrJz
         fMlNZVpONctqZNn4pe8Ej83FBhlRAQ3x00OF7vPhGTbZnlGh1znlRRtBpXQs9ry3ydtj
         N+EgKwWZ2BxGJTU0A3/XnddBENrsefTq1VVsXzFprI//0mwfM/j5RSJYTby+I6E9o8+7
         ggUn5oTUCIsFtqrTMEGiFyme5P8L4ExyDwkqBXfhNdBO5XQonLjHCQ18ljzGVeWMrTI+
         xkMQ==
X-Gm-Message-State: AOJu0YytaBs+s6G78K8OzRt8B9v9UkFfPhmutnpfJZXR8tVi21qtuN4h
	E3wVadQwR1Pj2dkmVyvyfCrjPKEKP2RZUlkjV+F+7HQk6cNFH073vpP9Pjo0ndY6H3IttXFBx5D
	n9cz2
X-Gm-Gg: AfdE7cn40i36KKQENVLkiOzl4TnSgoi5HIr1kl3CmvywnHQKVhqh2xsggeU8whhfheJ
	a1EleHkXuxSrzBcn5Wk58eYF7G7ykuVOGYjMTzL8/BkEsyRvsDLwLDJLXIJ6ZxKMz7TAXNPqNkw
	sTgbtYg7ILRYVC2kwjPgFz26PyontjLdmvd+SZWQBT5nc734Fve9VEi9wPm1hAK4qG8JzUIprYv
	pr8KbkNwKlKaEKiGYVmKtjRPgu5mnfxW4MLxgW+FhXDXgkGFs+lORNufNxEOzhvSsq6O2+UacJb
	B2NaqVSM8Wz8bv8bTJV+QovpIUPOglhe8DnkJnjQPSK14VXJNXEFBr4qKCt5muipRZxS4gH1bkC
	Dh7Zx1N+tRiRSBSpV1WgqUoHp983PZB7lY+xqyQc8/sI/GobBcKnIe25G9VQIFR9mkmbv2NQ2dw
	PlOJqxQHLJnBA=
X-Received: by 2002:a05:600c:1c20:b0:493:e97b:3b9c with SMTP id 5b1f17b1804b1-4954b560583mr24280245e9.29.1784297395233;
        Fri, 17 Jul 2026 07:09:55 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm49884525e9.0.2026.07.17.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:09:54 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:09:51 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org, 
	Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next v3 14/14] RDMA/selftests: Add rxe_netns_names
 test
Message-ID: <alo3nS7XrhjdRsSJ@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
 <20260716132316.1495242-15-jiri@resnulli.us>
 <20260717132429.3DE161F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717132429.3DE161F00A3D@smtp.kernel.org>

Fri, Jul 17, 2026 at 03:24:28PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] `wait_rdma_devs_gone()` fails to wait for dynamically renamed RDMA devices (e.g., `ibdevX`) to finish asynchronous unregistration, potentially causing module unload failures.
>--
>
>--- Patch [14]: [PATCH rdma-next v3 14/14] RDMA/selftests: Add rxe_netns_names test ---
>commit dabec57822c009814520c6cece67efb39fb7b1f8
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/selftests: Add rxe_netns_names test
>
>This commit adds a kselftest script that exercises per-netns RDMA device
>naming with RXE. It covers duplicate names, conflicts, move-with-rename, and
>same-namespace rename requests.
>
>> diff --git a/tools/testing/selftests/rdma/rxe_netns_names.sh b/tools/testing/selftests/rdma/rxe_netns_names.sh
>> new file mode 100755
>> index 0000000000000..f40118407f4c0
>> --- /dev/null
>> +++ b/tools/testing/selftests/rdma/rxe_netns_names.sh
>
>[ ... ]
>
>> +wait_rdma_devs_gone()
>> +{
>> +	local i name ns
>> +	local names=("$RXE_A" "$RXE_B" "$RXE_SAME" "$RXE_NEW")
>
>[Severity: Medium]
>Does this hardcoded list of names miss dynamically assigned fallback names
>like 'ibdevX'?
>
>During the TEST_TEARDOWN_RETURN test, the device moves back to init_net and
>conflicts with an existing name, receiving a dynamic fallback name (e.g.,
>ibdev0). When cleanup_devs() deletes the underlying dummy netdevs, it calls
>wait_rdma_devs_gone() to wait for asynchronous unregistration.

*Very* unlikely. Ignoring.


>
>Since the dynamic name isn't in this list of expected names, the function may
>return early before the device actually finishes tearing down. Could this
>cause the script to fail to unload the rdma_rxe module or leave a dirty state
>for subsequent tests?
>
>> +
>> +	for i in $(seq 1 50); do
>> +		local found=0
>> +
>> +		for name in "${names[@]}"; do
>> +			if rdma_dev_exists "" "$name"; then
>> +				found=1
>> +				break
>> +			fi
>
>[ ... ]
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260716132316.1495242-1-jiri@resnulli.us?part=14
