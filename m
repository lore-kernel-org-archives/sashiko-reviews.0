Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54B43B3F7
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419312; cv=none; b=MSsGfpNiGVdEDMmVPsaim/dZ/VNm4XexS/bQcoKdNCsdUn985+KSODuv8kzkfUUbUz8IAOXNxUBIC6OlzoAPPaAb7cuHYA7ia+fpbZEH6NRZg+kzKKKeo2MdOIHrLUtrfh48gusIPdWGWgvkCl8PDZ5oxLqXYwB20eRbuBJXdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419312; c=relaxed/simple;
	bh=vCQIJUU9nXDr4xoQdwGY1bHF89iCiRm/jH6lv31XiEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiuYodpd3fkdJthxvf1y1c+7t10oDZLQy/iOk9y8K4xArlwZ9nsa6j7MuIUZVKaM+ZnM/04DpOgQGMmfahdxN1wgVuEZyLX+N296Kb1xPbO/kYlBAxi7TFu+AXmbwWVAMSO9QV7JLfaY8pHhz0qj9oj9CJ4zu9obaoPsxkGhBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejqDcZuC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejqDcZuC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1fbe461f59so7839166b.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785419309; x=1786024109; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVywrhfa15eapzigH1Kkl2ZWf3WvjIE2DixDgT8FK2I=;
        b=ejqDcZuCetzyqNkkEDGDFiJSmzbsyde0stKYU3HPHaZuHNXmw0y5wim4BZsjfCGFCi
         RV4YxD/IOpg6yCHZAe270qEELKNVQwLaqkyHwz7tGFDBBaxOkml13GcytwFBt1Sbxt+q
         LEMQUmQpeJS/e4JYq9OI80rvUTXhmbN8VWuA7zieqq/fPAClK3Cp3AB8kMwt/iUFKhby
         TpSfd0+A0gRx68HhUVSlD18RupTkD7wYt4KYgXquDJ/3W6763ZRlHwDHVt6CwtPLCWZF
         0zvTqbOJ/ofatvNezVdF8KyyFJBgnhdfwLKAH4Gsz/XeUYDjNUblpZ28+6GF9hz/3xr1
         YDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419309; x=1786024109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVywrhfa15eapzigH1Kkl2ZWf3WvjIE2DixDgT8FK2I=;
        b=qL4kfWrUI7rJ0gNG9lHQhgvcptkIpSciSrY52lpShzMyAFcJs2dWiDBZh2y7j+tWK4
         vBoBMkIGp1dfSVQbcntKAn/gATJfgCusMw1oIywqNqkIa3YrDfkKvek6ibhYZSNZB9D8
         0flBbVn5WusFvsSQFJ7Bih3ugMpt8F/2UEw9ZqpaPRLJjp8cudH1nMpbmspE1hh495/j
         Nzf/z5mJRl2aeZjz6f6l2D7v2OLyCfLB4J9S8TFsAq59Er9U7b3eveWod9KjDmjrZ7lW
         FaboApjSMlxPTOtp1vIcvLDzqqAjnsaOxhYOA6HsQRH+xpPzjdvWiHK8jqul5w4RL8bF
         FERg==
X-Gm-Message-State: AOJu0Yy+oGtC7bAKCqjoW9j/gWe9fGoX/5YTD0yJ4tFke9SZiFJ3qPjr
	RfrJBnSCxSr2TO0/5QrzoTo4aaqWizoyKKbjuvuoIafSW35OTdw7GfTcERDOsV76CmM=
X-Gm-Gg: AR+sD13bIuvsuuO+sheI9mSm/SM24+VMDQmnKqaJl9zWdLPizxCNGqUfpUoLlc33o6s
	dxkIaxMal7Wnz54do8rFkSQbnF4kBawQM4RuYxdw7KiQhqWTjLPh217IlpSw0GSxjLJsk7fuEyW
	HmGDeXITYIXd8SAqN8QcmfjdWw2Nubd5ZFU8N6aEX8+yPH1EpNARCGaiPlQmfZAJpyY56J02Zz0
	5wR+AOPuUGrLamrzyPSjW0JbItLnHqhDn1GbLP7zOnFqU7NyzA7dlwLfTVhMc9E1UnBFm8gwHrh
	nq2UVmzV/r50+mBts3Qw8beWX2TbxzZn39aoWMABJcG5bXqRGiWGKtdMGhkE8zwpoCGoGHjiKHQ
	VoTp6mmpX7uby9YClsZdb/NGIjHXLXALnweVqBSUbOymObZ7ik70ON/8zBYaw117Oynn5Krb3H1
	fv8klZScD7Es6MAXHZvb6kD2x3/kvs37Rn1MjLxro/7gnMaYB08rQpzMH8IeIlw+WDH3/xZhu4q
	qs/0W6jRWuJlAiP1flgujwoD4pcJLEsJhCeAEEaz7HWQ748
X-Received: by 2002:a17:907:db15:b0:c12:80f6:7fac with SMTP id a640c23a62f3a-c1fa575322dmr126619166b.36.1785419308681;
        Thu, 30 Jul 2026 06:48:28 -0700 (PDT)
Received: from ?IPV6:2a02:8109:a307:d900:50b3:c1a9:d2a7:4006? ([2a02:8109:a307:d900:50b3:c1a9:d2a7:4006])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b723sm70384766b.12.2026.07.30.06.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:48:28 -0700 (PDT)
Message-ID: <e248c9d5-862e-4783-a984-ab29cb8f16f8@gmail.com>
Date: Thu, 30 Jul 2026 14:48:25 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] tracing: Make per-template BTF id lists
 file-local
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260730-b4-fix_btf_tracefs-v1-1-5f10b728f51e@meta.com>
 <20260730130352.476D51F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260730130352.476D51F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 2:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Using `BTF_ID_LIST()` instead of `BTF_ID_LIST_GLOBAL()` for tracepoint classes introduces significant BSS memory bloat when `CONFIG_DEBUG_INFO_BTF` is disabled.
> --
> 
> --- Patch [1]: [PATCH bpf-next] tracing: Make per-template BTF id lists file-local ---
> commit 49d7faf72ef8695ae45768a193f5a09e2cfe872d
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> tracing: Make per-template BTF id lists file-local
> 
> This commit converts trace event BTF id lists from global to file-local to
> avoid symbol clashes when multiple translation units instantiate the same
> class. It also explicitly provides local BTF id lists for handcrafted syscall
> events.
> 
> Link: https://lore.kernel.org/all/ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk/
> 
>> diff --git a/include/trace/trace_events.h b/include/trace/trace_events.h
>> index 09ad57ac4b73e..45ffbe04b5805 100644
>> --- a/include/trace/trace_events.h
>> +++ b/include/trace/trace_events.h
>> @@ -404,10 +404,12 @@ static inline notrace int trace_event_get_offsets_##call(		\
>>   *   [0] FUNC   __bpf_trace_<call>     (the BPF dispatcher)
>>   *   [1] STRUCT trace_event_raw_<call> (the ring-buffer record)
>>   * Exposed via the events/<sys>/<name>/btf_ids tracefs file.
>> + *
>> + * File-local: the class name is not unique, so a global symbol would
>> + * clash across translation units.
>>   */
>>  #define _TRACE_BTF_IDS_DECLARE(call)					\
>> -	extern u32 __bpf_trace_btf_ids_##call[];			\
>> -	BTF_ID_LIST_GLOBAL(__bpf_trace_btf_ids_##call, 2)		\
>> +	BTF_ID_LIST(__bpf_trace_btf_ids_##call)				\
>>  	BTF_ID(func,   __bpf_trace_##call)				\
>>  	BTF_ID(struct, trace_event_raw_##call)
> 
> [Severity: Medium]
> Does changing this to BTF_ID_LIST() introduce significant BSS memory bloat
> when CONFIG_DEBUG_INFO_BTF is disabled?
> 
> When CONFIG_DEBUG_INFO_BTF is disabled, the fallback for BTF_ID_LIST is
> defined as:
> 
> include/linux/btf_ids.h:
> #define BTF_ID_LIST(name) static u32 __maybe_unused name[128];
> 
> BTF_ID_LIST_GLOBAL(..., 2) only allocated 2 elements (8 bytes), but this
> fallback statically allocates a 128-element u32 array (512 bytes) per
> instance.
> 
> Because _TRACE_BTF_IDS_DECLARE is instantiated via DECLARE_EVENT_CLASS for
> over a thousand trace event classes across the kernel, this seems to silently
> add roughly 750 KB of wasted BSS memory.
> 
I'll follow up on this

