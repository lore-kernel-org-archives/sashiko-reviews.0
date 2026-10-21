Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580379;
	b=yOiO2KnL3O9qmwYnAKXmwO+pHRIzuTGvXHv0f76RE2k0WjtYS8gSUlWmB0uxTFExSx0u
	 npSzy+SFPs6d/OmGdNaemWYceL5cac3YfqmJ4S2gdd7f5olMHqXL9R3B/fzI+Q6rBJ0ho
	 +ikmarjfzlW+rjD5nY8LAxcua3uPVtcOWc+D0XGNQbhTNAqetWlRg5IiBbAob+L34t4Tv
	 K3+3qAKqj32tLhlSKuzCOFHfgLEXlphkD94MQdtJ9Yi6x/SI5UYGrkB5Rfn7PaAzNwjdM
	 Ds/H3BDsAmWd/d09aJ8NCumm1nBfa8CWu0XZyI5byDlz6tPk/xlBCGHVY2vcrs1dVzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580379;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EZGF2Rn+xGpbkoHxpw4caWn7Qkf8XmHK8YqDyB0mmTQ=;
	b=WC4l5zatZjH2Mdy0r9IpdnLsfChVVku0D1tMG5K05Np8vodI8WbOsemc24xVW+t94obK
	 UutPbVWxxhLYWUW1FgophfW7p9/05TU/5ae+xO1hc0iirRm+moooyai0R3KxG8c/FFwfJ
	 tugyr3480HdD1bTu3PHu2AX3nI3MJpm28RXympiSD2M/bLQoKP2StgZv1HVm80RFFLq3j
	 i+Idag54vxXmfEHT1muCgZU/VVUsAsrEBFJnx1hq34kJaXDQVAl/oxf7M/ZoMcMnD95fK
	 EpsNlrnUNhBT0XiJatNYeWwIQRii6rwuL0G+jVv51/r+PbKe3Uix0C7fuwYCijwFpmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=UqdNR6iB;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D81606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D81606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=UqdNR6iB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=EZGF2Rn+xGpbkoHxpw4caWn7Qkf8XmHK8YqDyB0mmTQ=; b=UqdNR6iB/jS77K5xbQgQaKcaWB
	Sd/o22Tu7Mq3aby2MbVTBu+CdNeNQDp9JN/2PQxYo47nLH4pSHokorFEvba6Ev0Lr4L9iLaN+MlGY
	ms7eR1EeDlXW1d9LQLQhv8Q5l3iAFGuQhvJAXVslYVrds11sd5sX5+6gCDtvmB/BILU5Lhg8yIoBa
	KtKuuJxAOwPV3FF87mhIhQWdHXHkvUXrCpN/bA3C+x9uvi7DnXmP0+9WPXAlY6SNh0oCpAD1V+axv
	nldKu67wyKribnYGbtuchdp7zQWD9qbYu+1fwdYLup44BJmiRNMl7bc3lGn6DrTIof4xZpIYMWVG9
	RHapZFbw==;
Received: from [179.105.94.163] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xJU2h-005YEC-6C; Wed, 21 Oct 2026 12:59:35 +0200
Message-ID: <3748ac1a-3afe-4293-8c20-48fcc4cf5f94@igalia.com>
Date: Wed, 21 Oct 2026 07:59:31 -0300
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
Subject: Re: [PATCH v2 2/8] drm/sched: Disallow initializing entities with
 un-initialized schedulers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20261020154123.33631-1-tvrtko.ursulin@igalia.com>
 <20261020154123.33631-3-tvrtko.ursulin@igalia.com>
 <sashiko-outbox-179327@kernel.org>
 <c32a1931-c0de-4d63-a8c8-2189c35137dc@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <c32a1931-c0de-4d63-a8c8-2189c35137dc@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tvrtko,

On 21/10/26 05:08, Tvrtko Ursulin wrote:
> 
> On 20/10/2026 17:02, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] drm/sched: drm_sched_entity_init() breaks v3d_open() on V3D 3.3
>> -- 
>>
>> commit 607520d70e20fa56f0a8fa9eade2db9f019b764f
>> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> drm/sched: Disallow initializing entities with un-initialized schedulers
>>
>> This patch updates drm_sched_entity_init() to reject schedulers whose
>> run-queues have not been initialized, returning -EINVAL instead of 
>> logging
>> a warning and continuing.
>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/ 
>>> drm/scheduler/sched_entity.c
>>> index e12709b7bd0c3..95bb79b3d003a 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -119,9 +119,16 @@ int drm_sched_entity_init(struct 
>>> drm_sched_entity *entity,
>>>                 unsigned int num_sched_list,
>>>                 atomic_t *guilty)
>>>   {
>>> -    if (!entity || !sched_list || !num_sched_list || !sched_list[0])
>>> +    unsigned int i;
>>> +
>>> +    if (!entity || !sched_list || !num_sched_list)
>>>           return -EINVAL;
>>> +    for (i = 0; i < num_sched_list; i++) {
>>> +        if (!sched_list[i] || !sched_list[i]->sched_rq)
>>> +            return -EINVAL;
>>> +    }
>>
>> [Severity: High]
>> Does returning -EINVAL here when !sched_list[i]->sched_rq break
>> v3d_open() on V3D 3.3 hardware (V3D_GEN_33)?
>>
>> During probe, v3d_sched_init() in drivers/gpu/drm/v3d/v3d_sched.c only
>> initializes the V3D_CSD and V3D_CACHE_CLEAN schedulers when
>> v3d_has_csd(v3d) is true:
>>
>> drivers/gpu/drm/v3d/v3d_sched.c:v3d_sched_init() {
>>     ...
>>     if (v3d_has_csd(v3d)) {
>>         ret = v3d_queue_sched_init(v3d, &v3d_csd_sched_ops, V3D_CSD,
>>                        "v3d_csd");
>>         if (ret)
>>             goto fail;
>>
>>         ret = v3d_queue_sched_init(v3d, &v3d_cache_clean_sched_ops,
>>                        V3D_CACHE_CLEAN, "v3d_cache_clean");
>>         if (ret)
>>             goto fail;
>>     }
>>     ...
>> }
>>
>> On V3D 3.3 platforms where !v3d_has_csd(v3d), those two schedulers are
>> never initialized via drm_sched_init(), leaving their sched_rq pointers
>> NULL.
>>
>> However, when userspace opens the DRM device node, v3d_open() in
>> drivers/gpu/drm/v3d/v3d_drv.c unconditionally loops over all
>> V3D_MAX_QUEUES queues and fails if drm_sched_entity_init() returns an
>> error:
>>
>> drivers/gpu/drm/v3d/v3d_drv.c:v3d_open() {
>>     ...
>>     for (i = 0; i < V3D_MAX_QUEUES; i++) {
>>         v3d_priv->stats[i] = v3d_stats_alloc();
>>         if (!v3d_priv->stats[i]) {
>>             ret = -ENOMEM;
>>             goto err_stats;
>>         }
>>
>>         sched = &v3d->queue[i].sched;
>>         ret = drm_sched_entity_init(&v3d_priv->sched_entity[i],
>>                         DRM_SCHED_PRIORITY_NORMAL, &sched,
>>                         1, NULL);
>>         if (ret)
>>             goto err_sched;
>>     }
>>     ...
>> }
>>
>> Previously, drm_sched_entity_init() logged a warning via pr_warn() and
>> returned 0, allowing v3d_open() to succeed. With this change, won't
>> every v3d_open() call on V3D 3.3 fail with -EINVAL?
> 
> Oh well, guess I overestimated the general public sensitivity to weird 
> error messages.
> 
> Given the submit side is guarded with the same v3d_has_csd() as the 
> scheduler init, so those entities are not reachable after open, I think 
> I can just add a patch which adds the same skip condition in the 
> v3d_open() loop.
> 
> Maira - does that sound like it would work?

I wouldn't worry a lot about this error. I'm planning to remove V3D 3.3
support in 7.5 [1]. Anyway, don't worry, most likely nobody uses V3D 3.3
with the v3d driver. If it doesn't break V3D 4.2 and V3D 7.1 (which have 
CSD), I'm okay with the changes.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7ffcc4fffb45ee98e7a9683e109050246dc194af 


Best regards,
- Maíra

> 
> Regards,
> 
> Tvrtko
> 
>>
>> [ ... ]
>>
>>>
>>
> 

