Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01221DF736
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173561; cv=none; b=HL/RLbLqB21p9Ok2wlFBvRPr4XAYbgTcu3B96pti+N8fZwrX154zkMKz7j+xEvSeVrV3befeMcfYrV6nJE3I4KHhzH3Pqxpkgizbl9t+4lBWbFww1K04yOLerTPV2vsB3NFIYBxA9TvUyo5mh6okUpfAyKeTB6rvr7diQ2PjtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173561; c=relaxed/simple;
	bh=Elx6dL9G/AknfEHrdQH99+c64PpUPn8ymRDWUvUJims=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U5iMcHieevd5ovoUqIHxGk9kafQcOIgVEM5l+vsxhfkSlXsmuzb/Uvi5I0UmlINP/+Hpmnns0m6UORMVH6BNC676DLC2fnfNSnicLcgsFC8NN/c3PfFPWYGP50TUbVqClPMPMZ1qrun2AsvySVqzwgej6Hl/bP969S6NEb2q8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OecyWgHA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OecyWgHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787173558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wnq/mMUvYPT2FqKv0iWXvqnhMPqfjLROzvncWakdzS0=;
	b=OecyWgHABkXyHXlx/Pazk56dcjqKlaY2WI790LFDEZLz8vtrXnKjtWLmwEDs3Bx/nqUBKn
	ThYeQuWirUf9F6HpuM1qn168OUsXu3MgpYniJjVKw3cROTswu2PbzLTZ5kwMqdUkkQ8jBG
	2L97djEc5NGI8VDBXL9zEXJjyBSaoT8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-VkXAyjIrMwKqvQq7yemfKw-1; Wed, 19 Aug 2026 17:05:57 -0400
X-MC-Unique: VkXAyjIrMwKqvQq7yemfKw-1
X-Mimecast-MFC-AGG-ID: VkXAyjIrMwKqvQq7yemfKw_1787173557
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fdace20927so11538236d6.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 14:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173557; x=1787778357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wnq/mMUvYPT2FqKv0iWXvqnhMPqfjLROzvncWakdzS0=;
        b=aXnmI+vIQkXSA5levS+giuc/0yXcwZLJKtUJzXBQCszPnzcyiVFXLWGfcobQZw/dg2
         s+SoSWXnCpqxcsTrAlusMLc02LC27YCKNik5IA/0cRnho05efwfo4d+WX7FGbvszEXr4
         dGccVXJDGjzTrOktlORKCDNF4DhPln9OVG0/AY6Jru/Nmqi8ua7tuVjfukM2L9YlVMQ2
         jkYgfPvNWAJ5NPn5nEXybosttAiMuX1cVPOwC4rQur8w2tsKXJp5H4hr7tTa0QPfufft
         Ik51Tw33HJ7JOz+8lgfZV7+IgqzlKDwc/6Pz/XXf3gqNVGbIIKBcZKD+SWS3vRlH7CCv
         gyjQ==
X-Gm-Message-State: AFuF++k9koM4OcFBADwub/JWfUJZzxMIPIQqQuV8BS6vM0cDzYHIG2IQ
	D38xDtxMEeeO3J0eWHgE5OekK1CAwL6bK47gh6rc+w8oz7BXq9ZJRIOTSsPRZM7D241odBzwL61
	AhcKUVI/OIJb8WOxG+wT2JvMnR+uAbVzBETR/klkuQK74GJ4qWAPfEYAERyglCNCjoIOqZj2Eb2
	dnPEfvzS3QHBe0jHTd+YLr7Vj86uzqupVQZE2LhDO+pZt585EXFGzz
X-Gm-Gg: AR+sD12es5BaOUyw7YkHk03eBh/4RUAk3ywUFq8PEPl25J6ARq4jYH3J5/oUpZeBQjg
	LnBL0wtID+207S0q1XokB4NWPJkmhkhWUG3NNetzd6WdllkL2vuShR7AO/jIgGnUOfnWPkK1HJM
	u5Fv6K/7DLG8BtqdkA/UBmFaHkC+sVucok5av+Loz4tMbPKvLoUxJ0uJzWK4uqWLh4JPNMEc18Y
	ttbUN5qnDXo+ldty+Y86TlFyFY7rcAGwwdGwa1oTK5EBAp8eXh9W9kcmNsjkmhZL5Ln4RuGDTOH
	0W/2+bKonONgshtPvosZnjZu9lvDhLLLELcDATd0n18sdWtR5mMXYzTS15DGKfBoKh/QKzJN4hi
	4vvkvioyEmw==
X-Received: by 2002:ad4:5ae4:0:b0:908:958f:4db with SMTP id 6a1803df08f44-90c5e94ec0bmr76601466d6.3.1787173556671;
        Wed, 19 Aug 2026 14:05:56 -0700 (PDT)
X-Received: by 2002:ad4:5ae4:0:b0:908:958f:4db with SMTP id 6a1803df08f44-90c5e94ec0bmr76600906d6.3.1787173556170;
        Wed, 19 Aug 2026 14:05:56 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b4ad5sm23304906d6.42.2026.08.19.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:05:55 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:05:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (ina2xx) Track active alarm in ina2xx_data
Message-ID: <aoYasBdVYNYa1OBB@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-3-349f7b2f1df8@redhat.com>
 <20260729161824.5D4C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260729161824.5D4C01F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kTnv6VLQw6iSGN9xzlZgynxM9pRa3ay9JdLaDB1kGLw_1787173557
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 29, 2026 at 04:18:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: Medium]
> Will this new state also be checked in ina226_alert_read()?
> 
> If an unconfigured alarm triggers, could it incorrectly return 1 since both
> alarms map to the same hardware mask?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_read() {
>     ...
>     mask = ina2xx_alert_type_to_mask(alert);
>     *val = (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
>     ...
> }

The state check is added in patch 4/4. I think I split the commits too
much though; I'll squash these in v2.

> [snip]
> 
> [Severity: High]
> If a user writes 0 to an inactive alert limit, will it unintentionally clear
> the hardware mask at the beginning of ina226_alert_limit_write() and wipe out
> the currently active alert?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_limit_write() {
>     ...
>     ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
>                  INA226_ALERT_CONFIG_MASK, 0);
>     ...
> }

Same as in [1], this is an explicit design choice documented in
Documentation/hwmon/ina2xx.rst.

[1]: https://lore.kernel.org/all/aoYYxM63yFRgrxFD@rh-jkangas-kernel/

> 
> [Severity: High]
> This is a pre-existing issue, but on 32-bit architectures, does this clamp
> operation compute a negative boundary for INA2XX_POWER?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
>     ...
>     case INA2XX_POWER:
>         val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
>     ...
> }
> 
> Because UINT_MAX is cast to signed long by clamp_val(), it could result in a
> negative upper bound, forcing val to a negative number which is then clamped
> to 0.
> 
> [Severity: High]
> This is also a pre-existing issue, but does setting a large shunt voltage
> limit cause an integer overflow on 32-bit architectures?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
>     ...
>     case INA2XX_SHUNT_VOLTAGE:
>         val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
>         val *= data->config->shunt_div;
>     ...
> }
> 
> If a user sets a large valid limit on a 32-bit system, the multiplication
> might overflow the signed 32-bit long into a negative number, which is then
> incorrectly clamped to 0.

These are addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various
overflow issues").

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3

