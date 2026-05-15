Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C92609EE
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875682; cv=none; b=QSc+iQ9afQdyCkog6efgplGPm9B4nB/e79dcBbJmb6eM/4dGki7RlmuLDlkcKNCw62pgvLp9c1Xcr1bgoy5ysmPgJu0D6+xvgmnMm4S1AJJZ/168kt1IWtbRu4zpdGjq/FDlImbGZenW3Do42f7/PxUUqlwsT9W82Kz2O45n7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875682; c=relaxed/simple;
	bh=ospAIioE7rmqG9WA6onadolG8rSmlDE7uicGcVokeJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+4lczUOUJal8+dk3GQ8vKwU7xG7sUYV31OsIRIhmDVTd1skah5LKIxAwEh6losf+EPmgGzqPrDYscyMiQs2/ROYUzN51IMCwlcigciGPZFMhS662DtlI5pwe071DOAmpaI9PB7x1Q+F6lRrPWKgWKgh+Za5E4u4psZP8WKLzJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiRRpq/0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiRRpq/0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so1306515e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778875679; x=1779480479; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIZB8xy3e5qz6ZXY2tL/cM3w8cODzrDOELxI3VYTlZ0=;
        b=BiRRpq/0GSOsMTGcNFKtYldpnRx43uVZau+DDrmnwkefJDfWpaHOK7UjtaQfFg26vD
         qJpASxxrDx+Dd4we5XCSX8ETMsYClaLV3VArEukUQ7LTTwgRrx2ZoRfHyXzyD1Vt/MV8
         lAUfJTuFuQuZC8W3eWdBgR+oByhIGHId6gxYeDFW5NP4omanEK2NnBoJGVXxnTJHGS+X
         vV25ixBFao1NVEJTf3l+f735P5NkuSNUFmuqODJ7btV9zxHrPFdlm3LT9n9b3IicPyog
         ohQV4e+9jDG8u3Uymj3VZiP80dBej0mDh1g9F0LtkbPRrBiUdHIktRw2MxUsCN1kfVBJ
         BOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875679; x=1779480479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIZB8xy3e5qz6ZXY2tL/cM3w8cODzrDOELxI3VYTlZ0=;
        b=XCQhRt5g3TIoa0E86NEPHGc1cQN95XG+5v7IcmM/Uri8vjobM5OaTdf6wcdmdIhwIL
         eTGl8xOzlBukguUkEj1DBv458awCAHvVNlfSmSWRaGFUHScoqZCj8VWQ3O/EvZFgc7oi
         nHqQpsOicynOYFyRR5Gpfldc2VZo8KybVhmGe2GQl4H8MAqG+YpouvY91tk+I6RRDf4e
         IuvbYXwum6E7xADjh4/9ahnRFRt2BtTAXFJiL7BNlfsBPsdoIL70Rgjb7Oi4s8MTAN11
         uveC3pIR6fycsePyAJUwhkXeeuYuHCQwr6ybB7vosa00AvGxBCIyUVByV1HnTUVN95Y2
         LKYQ==
X-Gm-Message-State: AOJu0Yx5Cpy4r3aY42RHoIhgCH5gVI8wuMXsqlM4bmgiBixkAdo+uOFK
	+Q+vL4qWQDikH7klLTIoc9pJWcwFKnAAw2kyTEqTZH6/bCeVlu1MDw6xJlGmUZcv
X-Gm-Gg: Acq92OGqE8UbxMdrbSxdCcG1SGgzMuNydq30h9cmX430poIP1U8MTnWrgBoXfmc/cPe
	FAFdhzjPk2HmUy7jJhaPH0UZLWNiHZRkF3m4NVVtgXUqZ5mqpR2jP0ghQbKQ6dJ2zNSDfyajgiQ
	2u33tfDKJ0RpAovFI5obupRENT3VK+mLonP1rLmsab5Zxl5m95yYoOF8Ev1hvSBM/qYvtX5WMhR
	sWRbZsEXOC2pZsQA63ryq20mjMhlSopY2+wdy/yrKZDt/4lNVnWP6+mxhmD8qcYdzkcyhVb5F5I
	4vRilvsL5K/Tm8XHic+YiR/IcNl/w5r4daX5pRqbUjXM84TNaa2bmZFvePlOjlz1fQPw8kUdFje
	q/5Mpad5vFwlXYv2G1CP2OLfkkFNqF1HWzj1Cckrw0DR0G+Hw8Je6AD3M/lPCADt/pvHST0PRZ0
	UM2EI7jxYGdDhUlzx+DBAkGDYTL5hIGTJYSLyU+ScO9TMhD+OW5Xia/4mWQcZT4DnMXHR5o42FJ
	2OWe4XQWHZu5jZkAeZxWg==
X-Received: by 2002:a05:600d:2:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48fe60ecd1amr56133525e9.11.1778875678729;
        Fri, 15 May 2026 13:07:58 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm81851315e9.7.2026.05.15.13.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 13:07:58 -0700 (PDT)
Message-ID: <24e10e8f-56b3-46fc-8537-fa677b2d2ddf@gmail.com>
Date: Fri, 15 May 2026 21:07:57 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/3] tracing: Expose tracepoint BTF ids via
 tracefs
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260515-generic_tracepoint-v1-2-aa619fa94132@meta.com>
 <20260515182509.A08E7C2BCC7@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260515182509.A08E7C2BCC7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 7:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The global `event_mutex` is held across a `copy_to_user()` operation, creating a denial-of-service vulnerability and latency spikes.
> --
> 
> commit 5bcf593e0ef00b79b0e87af32e5fdb4e5481d768
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> tracing: Expose tracepoint BTF ids via tracefs
> 
> This commit introduces a new tracefs file btf_ids for each event. It exposes
> the BTF object ID and tracepoint/raw BTF IDs populated by resolve_btfids at
> link time to allow raw_tp and tp_btf BPF programs to properly attach.
> 
>> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
>> index c46e623e7e0de..d463fb44c790a 100644
>> --- a/kernel/trace/trace_events.c
>> +++ b/kernel/trace/trace_events.c
> 
> [ ... ]
> 
>> @@ -2200,6 +2201,62 @@ event_id_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
>>  }
>>  #endif
>>  
>> +#ifdef CONFIG_BPF_EVENTS
>> +static ssize_t
>> +event_btf_ids_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
>> +{
>> +	struct trace_event_file *file;
>> +	struct trace_event_call *call;
>> +	const struct btf_type *t;
>> +	struct module *mod = NULL;
>> +	u32 raw_id, tp_id;
>> +	const u32 *ids;
>> +	struct btf *btf;
>> +	char buf[128];
>> +	int len;
>> +
>> +	/* Module unload could free call->class and ids[] mid-read. */
>> +	guard(mutex)(&event_mutex);
>> +
>> +	file = event_file_file(filp);
>> +	if (!file)
>> +		return -ENODEV;
> 
> [ ... ]
> 
>> +	len = scnprintf(buf, sizeof(buf),
>> +			"btf_obj_id: %u\nraw_btf_id: %u\ntp_btf_id: %u\n",
>> +			btf_obj_id(btf), raw_id, tp_id);
>> +	btf_put(btf);
>> +
>> +	return simple_read_from_buffer(ubuf, cnt, ppos, buf, len);
> 
> Does this hold the global event_mutex during copy_to_user()?
> 

Right, I don't need to hold mutext for that long, should drop it before
scnprintf() call

> Because guard(mutex)(&event_mutex) holds the lock until the function returns,
> the mutex remains locked during simple_read_from_buffer(), which internally
> calls copy_to_user().
> 
> Could this allow a user to intentionally stall the global tracing subsystem?
> 
> If the user-space buffer is backed by userfaultfd or a slow FUSE mount, the
> page fault could block indefinitely while holding event_mutex, which protects
> system-wide tracing operations (including module loading and unloading).
> 
> Looking at event_filter_read() nearby, it explicitly releases event_mutex
> before calling simple_read_from_buffer(). Would it be safer to use a similar
> pattern here by dropping the lock once the buffer string is populated?
> 
>> +}
>> +#endif
> 

