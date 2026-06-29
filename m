Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D838B14C
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765821; cv=none; b=drfheX8ZkqTWqBlKCqHHyBuYRwwgEalWq2u/Eyfi1u9IwnnSMiJco1FFXNO26sh+aoQRvdRh2OG8i1Vh81VENgBcMsIDsozNmubGun1OwN6VvBe+PYvB9ynh0Rci9kwl42Ad1XGtOGNm97z05zFqVonQx11Lg/fbkLwl0b6EM2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765821; c=relaxed/simple;
	bh=M6STihrQUAklYR6JBrtb/7y3R/LgCadWhCefU+9ViUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sok/CTvO+SW1hQxzGq4W44xJYxV0dECmFsK/mAOppOse8y77MY2ztFIx0oFlh6wTN99pgSwSdp8UJ906MGm4/FNKAScSaUjNu0j3FwmQPgLIH9BcjlAc995bnyaRZ9cspmDCPpxfxJSJS9OsH5UqX/cC3f1oP81qvhCJJMNUXDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZf9Nl0A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZf9Nl0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782765818; x=1814301818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M6STihrQUAklYR6JBrtb/7y3R/LgCadWhCefU+9ViUA=;
  b=TZf9Nl0AD/pwpc0ot9vwdjRPt4IJrpVlaKhm7B4ap+K1c4YN5vsuzXZX
   NDDwki4d+T1TXS9SI36bqk6FVb3ZHscLwLumWGqr5UI69SJPu3NLKB0ca
   vKgDyQJ1fLt5Aw88yO1CO6v4BypZ1bs/X8IKGztLsx2LBIa4PVFBDWS7E
   +x9F3OTEkQcG94jZtcVY1rB/KgePy6T4NMP3PZhhKCjKEFa1C8tUKxrDn
   CWRq8yCVHGeQIPIGmil+TI03Z3L6iFggYJ0+H5KnGsptg9x8l8K8H1Np+
   5XABAhWp+6R2FxuuNXc9grgz1YC7ATkbit0ixTGePVEWSd0U+fJwCWlHl
   Q==;
X-CSE-ConnectionGUID: vjccNOnmR8+HKILzlI+WTQ==
X-CSE-MsgGUID: vX10H2uBSnWKbzY6IFaGwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="70995064"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="70995064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:43:37 -0700
X-CSE-ConnectionGUID: 1JXOif9jR0Cn33IDnjEJtw==
X-CSE-MsgGUID: Ez2gSDiRSJOzKSQKFEMm5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="252716060"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO [10.125.109.194]) ([10.125.109.194])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:43:37 -0700
Message-ID: <93e19eb7-0691-47c1-bbf8-838af84b5c89@intel.com>
Date: Mon, 29 Jun 2026 13:43:36 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] cxl/test: Add hierarchy enumeration support for
 type2 device
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
References: <20260629202720.3658117-1-dave.jiang@intel.com>
 <20260629202720.3658117-5-dave.jiang@intel.com>
 <20260629203658.574A51F000E9@smtp.kernel.org>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260629203658.574A51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/26 1:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The error path for cxl_test_init() incorrectly replaces platform_device_unregister() with platform_device_put() for cxl_acpi, leading to a resource leak and potential use-after-free.
> --

Uck. Merge error when doing the rebase. I'll get that fixed up.


> 
> commit 74917ddebbac04cd137d2f935b0132cdc7d979fe
> Author: Dave Jiang <dave.jiang@intel.com>
> cxl/test: Add hierarchy enumeration support for type2 device
> 
> This commit adds enumeration of type2 device hierarchy in cxl-test. The type2 
> device is configured to be directly attached to a root port instead of the 
> rp -> switch -> device setup used for type3 hierarchy.
> 
>> diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
>> index 8abe066080bc8..1eac06ad46601 100644
>> --- a/tools/testing/cxl/test/cxl.c
>> +++ b/tools/testing/cxl/test/cxl.c
> [ ... ]
>> @@ -2156,17 +2314,9 @@ static __init int cxl_test_init(void)
>>  err_mem:
>>  	cxl_mem_exit();
>>  err_root:
>> -	platform_device_unregister(cxl_acpi);
>> -err_rch:
>> -	cxl_rch_topo_exit();
>> -err_single:
>> -	cxl_single_topo_exit();
>> -err_switches:
>> -	cxl_switches_remove();
>> -err_root_ports:
>> -	cxl_rootports_remove();
>> -err_host_bridges:
>> -	host_bridges_remove();
>> +	platform_device_put(cxl_acpi);
> 
> [Severity: High]
> Does this error path properly tear down the device if cxl_mem_init() or
> hmem_test_init() fails?
> 
> Since cxl_acpi was already successfully registered with the driver core via
> cxl_mock_platform_device_add() earlier in cxl_test_init(), it seems
> platform_device_unregister() should be used instead of platform_device_put().
> 
> Using platform_device_put() here only drops the initial allocation reference,
> leaving the device actively linked in the platform bus and sysfs hierarchies.
> 
> Because the module unload upon initialization failure will free its memory,
> could any subsequent access to the device's sysfs files dereference invalid
> memory and cause a use-after-free?
> 
>> +err_topo:
>> +	cxl_topo_exit();
>>  err_populate:
>>  	depopulate_all_mock_resources();
>>  err_gen_pool_add:
> 

