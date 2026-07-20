Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA12414A21
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554088; cv=none; b=o6GFYTga/qlNDoBnk3wBGpULv2YmKVEaBpSPrwg+QEEZNI9fEQ+Dbz61/O0wkNi4I2aE9Y+oH7qxAi9LreL0NO4Yl9SXlduOOKJvGgX688TR7P/jeru85FHHcC8ZqHwBNp/1LoAZvf8kT0ZzWAXAqUs2SzkmE3vZRAFUwdiBkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554088; c=relaxed/simple;
	bh=WFsvkvo1SmgL7lQS2bCBRqIPfpJNPnGjjQa+jIXyK6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLQtjjwgmsq61kh22dDsYnwwi68ZbLIQ+YxEhK5vjUzAyJNcJ2xGfC8X7Bc2Qp0sh6YTaxCQ71EukgecZrROvX1WAVS+CzPfEUYsqZCCcNDaagrzgwnXh/WgGGqMOsZ1YMiNJNj1J2YcgQej1yYD8iXSlfgoPnj53rldvvNu2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SkQyCHf5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SkQyCHf5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so43168365e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784554084; x=1785158884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bi19W6oapueN1efZ+izIaahgjmtnO9MBZANr+n3yuz8=;
        b=SkQyCHf5HWdz9PPt+5rWtlgn4wmyiGrdK9Oxmg3NpOtrqxqQj9rTc9u3kXsggHqc0V
         DrDTtgVgHKzkiOUFgrU0W/jCYO0SJX26GIHNL1N7qLInQtmN6UIz8Cq3bb7WBcECy5Gr
         QTcapTbZx4zxrPxUno+1RzFkFFek0L92/72q9712RlcrAetKLaBh88xOSg3CytHPCG0B
         lJ2M7dkcfSX8+d4HAe1fhXutO6s0FRAua8ONALt99Bq5ZdwuO5V+628SHV1C8COduSzL
         80XNIEwXJbV8u3JYjtKOq2Z6VhIemy1oqIWld5iCCK6yZ1bduaQwBdbAqwRPBDMOIepK
         u3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554084; x=1785158884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi19W6oapueN1efZ+izIaahgjmtnO9MBZANr+n3yuz8=;
        b=YMd8HDg/xhBOan7gW5q6q9chCohHoxP1FVvDOSuzOuv3tZjGY9BFDWWZDLIGpoA2VV
         dAPaHfB01E9YqqRdrZfKoL5iVqDNsJAALyBt8StfH/3zkK8NEKAoQC6x/LtGBFqxCnOD
         g+DbymM1BZf5m5jFC8sIUm8VceVFcuDTpP9YrHb2hsM9MM6DQM0B6AnSk4zfyKApWqz4
         GxH+uXDod09drGkAogF5boQjuvQWxcA4iTaust+eWkHZurcUq9/SThf2j9bBMAuo7xQe
         NFzBxhAKKN/FL0wloU/4C3NC6gFc6pvtApxGkoKfTjIFlq/q3RPGuoWJkUJTEDoN90WG
         zA2w==
X-Gm-Message-State: AOJu0Yximm6eddP/rL92m06SKXimhbnpmX0JFIqyzb0rI/RcNscgyXL3
	JESWxs5rj3wKNYG1GTfmnmvz7njIIJe6V8bhUtcd6daLF08jtGoiH6NKG/sn1AVc2SIs8bsxm66
	wI2I5J50=
X-Gm-Gg: AfdE7clNa4Am4pqtocWPM+CohM6sjE7rGYCAsLWy42qxFu6UYTjTmzl2OK0XcUkNd6o
	4l17XX/afb4xynYwyfdN8PyPpV3dPO0eI5m24C2At/jZHGG1GXg6yPdesSxhPADQ8AgDJC0KbV/
	unrvko/mYP0B06u52zjibGSWTor/XuW1y7Wn80oQJOC+V89BsjoFAW2RxWshvGXvK8w99gwaPQZ
	x4M7De4G7/ZaGQabPjJjJGpDEVmlv4gM7GQq1drlYUkaYh3iNRfExIkrFMry+iKnDZghyE81pM9
	5HOUyhM8qoM1hmVVbsDft9DKhRJ2ht2omtAfrqFMvBdxag4YHgUme/ZYsRq6DS7TE9eqhZ9Mihk
	cenWuRHk44FsVNAeBoC+RUa7ZQk5GFvRveGKqrZ0wNi0Qbb+l++Xx2FABeh+doGdbbeZaDI6BJT
	SaF0UF3ZDh9amPVp9xOViRIvAEPjAMq2oVTeXnUp9gvGFLJVpkGw==
X-Received: by 2002:a05:600c:3b91:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4954a3d0065mr192195215e9.3.1784554084438;
        Mon, 20 Jul 2026 06:28:04 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30908170f8f.24.2026.07.20.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 06:28:04 -0700 (PDT)
Message-ID: <36453665-f4f6-44c6-8e89-e73297df9dad@suse.com>
Date: Mon, 20 Jul 2026 15:28:03 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] module/dups: Fix use-after-free in kmod_dup_req
 lifetime handling
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org
References: <20260720121621.750661-1-petr.pavlu@suse.com>
 <20260720121621.750661-2-petr.pavlu@suse.com>
 <20260720123244.EDE231F000E9@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260720123244.EDE231F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/20/26 2:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] A pre-existing use-after-free exists in `kmod_dup_request_complete()` due to `kmod_dup_request_announce()` queuing `complete_work` without holding a reference.
> --
> 
> --- Patch [1]: [PATCH 1/5] module/dups: Fix use-after-free in kmod_dup_req lifetime handling ---
> commit c16274209ebc300f334c8ae6c8a5bec3494aa562
> Author: Petr Pavlu <petr.pavlu@suse.com>
> 
> module/dups: Fix use-after-free in kmod_dup_req lifetime handling
> 
> The kmod dups code uses RCU to ensure that a kmod_dup_req instance is freed
> only after it is no longer referenced. When releasing an instance, the
> kmod_dup_request_delete() function removes the kmod_dup_req from the
> dup_kmod_reqs list, waits via synchronize_rcu() and finally frees it.
> However, this doesn't work correctly because parallel users referencing the
> instance in kmod_dup_request_exists_wait() don't enter an RCU read-side
> critical section. This can result in a use-after-free.
> 
> Fix the issue by changing the lifecycle management of kmod_dup_req to use
> reference counting.
> 
>> diff --git a/kernel/module/dups.c b/kernel/module/dups.c
>> index 1d720a5311ba0..e1828e865edde 100644
>> --- a/kernel/module/dups.c
>> +++ b/kernel/module/dups.c
> 
> [ ... ]
> 
>> @@ -224,6 +241,10 @@ void kmod_dup_request_announce(char *module_name, int ret)
>>  
>>  	mutex_lock(&kmod_dup_mutex);
>>  
>> +	/*
>> +	 * Find the entry previously added in kmod_dup_request_exists_wait()
>> +	 * that is owned by the current task.
>> +	 */
>>  	kmod_req = kmod_dup_request_lookup(module_name);
>>  	if (!kmod_req)
>>  		goto out;
> 
> [Severity: Critical]
> This is a pre-existing issue, but is there still a use-after-free risk for
> complete_work even with the refcounting switch?
> 
> Looking further down in kmod_dup_request_announce(), it queues the
> asynchronous work item without incrementing the object's reference count:
> 
> 	queue_work(system_dfl_wq, &kmod_req->complete_work);
> 
> Because no reference is held for the work item, kmod_req could be freed by
> delete_work before kmod_dup_request_complete() finishes executing.
> 
> When the work executes in kmod_dup_request_complete() and dereferences
> kmod_req to call complete_all(&kmod_req->first_req_done), this could access
> freed memory.
> 
> Can concurrent auto-loads trigger this? For instance, if multiple tasks
> execute __request_module() concurrently:
> 
> Task 1 (wait=false)                 Task 2 (wait=true)
> kmod_dup_request_announce()
>   queue_work(complete_work)
>                                     kmod_dup_request_announce()
>                                       queue_work(complete_work)
> 
> Could the second complete_work execution be queued just before the 60-second
> timer expires, and run right after delete_work frees the object?
> 

I agree. The code has an issue when two concurrent request_module() are
active, one using wait=true and the other wait=false. When the
wait=false call wins and announces the result via
kmod_dup_request_announce(), it can complete the kmod_dup_req object
allocated by the wait=true call, which can later result in
a use-after-free.

Sashiko also reported the same issue in a reply to patch #2.

-- Petr
