Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103512;
	b=1bKiq7IDD4D7f8VFBWhKdHnpKCmNs38oJW/ZBddPES6/kYz7rHXVuv/RY6LZ1O/LQ5Q5
	 QPOKiqHU/O3hPJeGt9IA6WhcuoyP3DO8fPTm3gPXmt69evXVnMqX9qwEwr/JyF5OdkNG4
	 io/ndyxTkwazHbxB6TFzxLjQobd53eiWXEWl20MS99bPm96LHUizYNXlh68Ll+A+2hJVb
	 a+aWZgmcLa7JQBC+1eQMHWK2L3sbZrh9jds8Mm8PgtfOSxjezxntAU5B1kBn79RQgbhYF
	 HOwxtsjcM9fQ4eJiVTE2Y+vzil6UlLRlLCK8f2iJVwri71PY4te6kG7Bod5lHWQesYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103512;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VgX1vJfVrS91glS0/Dx0K0aJAQ+tQlfM9n2junWWrc8=;
	b=Gb4anMnlva0PqCxnpsllFF3GPRck/TwE/leWl6GDuyJMFYq+cU26/ckiiankTb+wqzIR
	 9TAFnWisS8Z4eMvcjWPaYbdRnVvDIAdAZR5mmtA3aL5YMFUh6DCsqupwnjf0zUq4hZ1O1
	 WmbmhfWKEhchvlPpwdcTfJob2hJUXZCFhFDT/BMdwgoFNQ/F83AAS7TwXC+MDQVLRSeeF
	 Z1pa/BsNLYo4myhIeUTgEuVvrV6fKzPDFVQOGh0KMGzsVoC0ri+Sfbhhvdt5T7kFCPMZj
	 rlyx+Ib8pToeQectGffKmdRg6hZzZ5WmyIn0jlnr+Sha0YYOdk7DJQhLUFXEB3jisaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EmHBd8w1;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC63606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 12:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC63606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EmHBd8w1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793103511; x=1824639511;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jCZHV43DO2tk0qhoLNn/vBqgwd4tP9frgfub/kIRx7o=;
  b=EmHBd8w1gXK0ss5GyZe5j2bwcoC2MkdB23CGLkVmtohOlBD6cBI1eQsF
   ucxNG7DZhN+kG4UAlRLItg18iMfFSW7xhEN+EY66DciBgwc+EqHzt1znS
   4i6mdi/zlBVnnl4ie7VhdDf63btHKoYvkbgm08sSj2K6F/dpesci9QVnB
   FITYT/0TMT32j3kd6uIbR0/KGscxJFbT31oELKQlWyYdHhEvKxWauEPUr
   j3LW/tXvPfpkSBLishkxs24KJCKQBtYu53ckfgh49+EqVePWYcibLc/sP
   CWnttie432glP+dBRwHXkkFA4AVM2R4or1CBORqX97pJuK04ZanaLfJ97
   A==;
X-CSE-ConnectionGUID: 1Z+aXngWQAmglvTTEFV5fw==
X-CSE-MsgGUID: YtXKmmi0R+KrquI7v9HzEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1685358"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1685358"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 05:18:31 -0700
X-CSE-ConnectionGUID: qAnauhh9SyWfOY2Om9KxTA==
X-CSE-MsgGUID: Exsm3ztfTOa3YdxBWoUmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4911792"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.199]) ([10.245.245.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 05:18:30 -0700
Message-ID: <9e1e649c-78be-44de-9ff5-bfc1e17a6d1d@linux.intel.com>
Date: Tue, 27 Oct 2026 14:19:04 +0200
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: hdac_hda: Balance the runtime PM disable in
 codec remove
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
References: <20261027083840.28813-1-peter.ujfalusi@linux.intel.com>
 <20261027083840.28813-4-peter.ujfalusi@linux.intel.com>
 <sashiko-outbox-186315@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <sashiko-outbox-186315@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/10/2026 11:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ASoC: hdac_hda: codec stays powered in D0 on re-probe due to RPM_SUSPENDED state
> --
> 
> commit fc19b5dab0635a3fee4ca467d334fb76459c8230
> Author: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> ASoC: hdac_hda: Balance the runtime PM disable in codec remove
> 
> This patch re-enables runtime PM at the end of hdac_hda_codec_remove() to
> balance its earlier pm_runtime_disable() call so that runtime PM does not
> remain disabled after snd_hda_codec_register() runs on a subsequent probe.
> 
>> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
>> index cae5711e979c3..bd4b113401a8d 100644
>> --- a/sound/soc/codecs/hdac_hda.c
>> +++ b/sound/soc/codecs/hdac_hda.c
>> @@ -554,6 +554,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
>>  		return;
>>  	}
>>  
>> +	/* prevent runtime PM callbacks while the link and the codec are torn down */
>>  	pm_runtime_disable(&hdev->dev);
>>  	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
>>  
>> @@ -561,6 +562,9 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
>>  		driver->ops->remove(codec);
>>  
>>  	snd_hda_codec_cleanup_for_unbind(codec);
>> +
>> +	/* Balances the disable above, cleanup_for_unbind keeps runtime PM disabled */
>> +	pm_runtime_enable(&hdev->dev);
>>  }
> 
> [Severity: Medium]
> Does the codec hardware still stay powered in D0 after an unbind and re-bind
> cycle even with this balanced pm_runtime_enable() call?
> 
> On initial device creation, snd_hdac_device_init() sets runtime_status to
> RPM_ACTIVE while runtime PM is disabled (disable_depth == 1). However, when
> hdac_hda_codec_remove() finishes, runtime_status is left as RPM_SUSPENDED:
> either the codec was already runtime-suspended before an ASoC card unbind,
> or on a codec driver unbind __device_release_driver() calls
> device_unbind_cleanup() -> pm_runtime_reinit(), which sees
> !pm_runtime_enabled(dev) and calls pm_runtime_set_suspended(dev):
> 
> drivers/base/power/runtime.c:pm_runtime_reinit() {
> 	if (pm_runtime_enabled(dev))
> 		return;
> 
> 	if (dev->power.runtime_status == RPM_ACTIVE)
> 		pm_runtime_set_suspended(dev);
>     ...
> }
> 
> When the codec is probed again, hdac_hda_codec_probe() enters with
> disable_depth == 1, usage_count == 1, and runtime_status == RPM_SUSPENDED.
> It acquires the HDA link via snd_hdac_ext_bus_link_get() and calls
> snd_hda_codec_device_new(), which powers the hardware up to AC_PWRST_D0 and
> calls pm_runtime_forbid(). Because runtime PM is still disabled at that
> point, rpm_resume() returns -EACCES and leaves runtime_status as
> RPM_SUSPENDED.
> 
> At the end of hdac_hda_codec_probe(), it assumes runtime_status is still
> RPM_ACTIVE from initial device creation and never calls
> pm_runtime_set_active(&hdev->dev):
> 
> sound/soc/codecs/hdac_hda.c:hdac_hda_codec_probe() {
>     ...
> 	/*
> 	 * hdac_device core already sets the state to active and calls
> 	 * get_noresume. So enable runtime and set the device to suspend.
> 	 * pm_runtime_enable is also called during codec registration
> 	 */
> 	pm_runtime_put(&hdev->dev);
> 	pm_runtime_suspend(&hdev->dev);
> }
> 
> When snd_hda_codec_register() subsequently runs, it enables runtime PM and
> calls snd_hda_power_down():
> 
> sound/hda/common/codec.c:snd_hda_codec_register() {
>     ...
> 	if (device_is_registered(hda_codec_dev(codec))) {
> 		snd_hda_codec_display_power(codec, true);
> 		pm_runtime_enable(hda_codec_dev(codec));
> 		/* it was powered up in snd_hda_codec_new(), now all done */
> 		snd_hda_power_down(codec);
>     ...
> }
> 
> Because dev->power.runtime_status is already RPM_SUSPENDED, rpm_suspend()
> inside snd_hda_power_down() returns 1 immediately without invoking
> hda_codec_runtime_suspend() or scheduling autosuspend. Doesn't this leave the
> codec hardware powered in AC_PWRST_D0, the HDA link reference from
> hdac_hda_codec_probe() held, and the display power reference from
> snd_hda_codec_register() held, unless pm_runtime_set_active(&hdev->dev) is
> also called in hdac_hda_codec_probe() (similar to hda_codec_probe_complete()
> in sound/soc/codecs/hda.c)?

Yes, this is valid, I will add the pm_runtime_set_active() call.
Now tested on device and it is reflecting correct state across the
expanded test matrix.

> 

-- 
Péter

