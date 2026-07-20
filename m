Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAF419FBC
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554132; cv=none; b=jaHyjdEbntUX4kkS/HkSJp0W74AJuNk23JuSE+iR9JNQFvrAPthsT/MVTqLMEzZP/E0CRvvv4DSzVVaXjIdZrAxsmqiCN65wWT2ETSQlAXmobfz0YRIyuGIgTsiJOPjtT2J3xUJFP+bN8gxJTDfr2X2GWeUV1mXqCzPODH/thvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554132; c=relaxed/simple;
	bh=a1dT4T2rg25BuLqB3IXHvcJ/DhyM0LaFghciO/e5KnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mzq4/Ot2oMChM/4GnA+1ijHA4/eZDnOAhFAS1Kbf2Qosw2ZOGTqcULWmCuZLQd7ZAzBu8Z6EQQKSuvK5+0tiUTSmCGLJyug52OQ82MoEoWiTJHcznwXeN9I6X3wNFb/9UGW2r4cPuAKPXsQGg1BFsCvQCQw1tB1Hxmc4TuAjlto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XFuL2ryF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XFuL2ryF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso20532855e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784554127; x=1785158927; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/czDj3io+OIqwlJnYUmkw5KpDAkmwxo4+tPoyggzt8=;
        b=XFuL2ryFnZa0g0b0XjXTR5ZlUqt2Hx1VrkB2drzNPFpHE+SE3kl6BnntsSoaJOzwF+
         tc8FSj939rEFju6NnjGSKWgGBRD6iZ816GttCC34pJh5bpWJVH+mA/iTtJQ/UgpQwpJ0
         T1+cSDGZ3Uwj2ZvNnzRj85tMfZ0W1d0OTyjm665W5gfEFWmsQXNS8xbbJHUiLCye0K06
         3FI6hQdsfCtZy5AuvjN84OBve49PnuMSFP19WYg19bI5MjgyX+sj2pWDszcwqpcY1QFg
         8b5g8F98ws6f4dh+COxFbg/cFbLl3Um6EC5jmtF9UcUBmkPcKBbrKmGeJ0iQRiVaxg26
         iv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554127; x=1785158927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/czDj3io+OIqwlJnYUmkw5KpDAkmwxo4+tPoyggzt8=;
        b=kvmpzlakXCpnNNJJTfPXdtYhBILG+J6emDiqULjtd9c1/JtFsFOO2hRd4iA+jHhTKK
         YFjlkX21M1dlGbquTYrexi3IjEXdSWCnYpYYPc92dycntzZpB7ua0EXWGBMEsVbl7E8N
         MzyJ9JhYQiRSsdK5/oEzgG8tKTXOGzcnhjMeOU4bm7Qf532iFSaOHKpGJUHWDjL5ZWZc
         GqsWtnj7jwqzcIp9ImLZFWn3k8fL2XO3kcSt4bfOIhzvFqhYANjhwMfSLj0X1MHv0dSx
         r6xdVxtFXDjsFkeqxgkcdZcp07CiE7Q/XiLN593xqo2E8bKryU2yugusuXRVMqH8+HiM
         a63A==
X-Gm-Message-State: AOJu0YwePtp+J5IrSU3L/7KAnKMs97Fkzu47LOSTMsAz6erkXV1W56x1
	owtCZ5geCS2uONyMbF7u71kU0bAOCNSS96qawOIm3WINPeKJBH/uy3EpfNHqkK4NYNvQ+Ah6hff
	EGAkWrNU=
X-Gm-Gg: AfdE7ck6tINe3CiBrX7ywGm9h1O5ZF9TTQn4w2q/0X7EzfFVh77rv/yFG8HYD2J9Ptg
	X8MMSgwrxQaMq0T5pkZ4b8FFy+/Vxn2MWBBPW8HeTJYz3XK6S6Ioe4sX3QXVnvs9erbvrqgCJ0f
	FZ1RBItmDdWSTOVqdE0Pwzz05DNCvm08HYetACWRH9CDekC9aMUtklIQ5OWa4UtSLkrjSB8Ju3g
	FQtvBEmnJT2lsElHgNj+CK5FCLSBmBBGgMi45OZ7OqIF4z9jINjRV4KUHjWbwYAe3rWjkqYz+j4
	2wLcuLDXJ1FYZHuO2JAQF03bN8WZ/z+aLverTf6jC2xWUN/qnJjnX/TH+jfdFr8x0tLsAGWnxKy
	N3KJ+BCsI/ysEJYrrbnSzy0Wvag6I36jNdDSHECAxMVBe0Hxv2Ha6LHSPGyxyBHFG8pJDCzGLI+
	XQsYy4pcxAUWywDsb+50BaSDdo5o2p8HXM51Ddr7GNcdHdipcRhA==
X-Received: by 2002:a05:600c:4505:b0:493:f176:dc69 with SMTP id 5b1f17b1804b1-4954a413087mr149688055e9.37.1784554127449;
        Mon, 20 Jul 2026 06:28:47 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm28679042f8f.37.2026.07.20.06.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 06:28:47 -0700 (PDT)
Message-ID: <e4087c28-c79e-4261-8881-68034fada860@suse.com>
Date: Mon, 20 Jul 2026 15:28:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] module/dups: Use scoped guards for kmod_dup_mutex
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org
References: <20260720121621.750661-1-petr.pavlu@suse.com>
 <20260720121621.750661-4-petr.pavlu@suse.com>
 <20260720122533.1F9661F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260720122533.1F9661F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/20/26 2:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Mixing goto-based cleanup labels with scope-based cleanup (scoped_guard) in the same function.
> --
> 
> --- Patch [3]: [PATCH 3/5] module/dups: Use scoped guards for kmod_dup_mutex ---
> commit 3299ca2ac8ae46392f412ae7c186f4907e7f8201
> Author: Petr Pavlu <petr.pavlu@suse.com>
> 
> module/dups: Use scoped guards for kmod_dup_mutex
> 
> This patch replaces explicit mutex_lock/unlock calls for kmod_dup_mutex
> with scoped_guard to shorten the code and clarify the lock's scope.
> 
>> diff --git a/kernel/module/dups.c b/kernel/module/dups.c
>> index f0bdd7560d7e7..a62619ec057ed 100644
>> --- a/kernel/module/dups.c
>> +++ b/kernel/module/dups.c
> 
> [ ... ]
> 
>> @@ -122,10 +121,13 @@ bool kmod_dup_request_exists_wait(char *module_name, bool wait, int *dup_ret)
>>  	INIT_DELAYED_WORK(&new_kmod_req->delete_work, kmod_dup_request_delete);
>>  	init_completion(&new_kmod_req->first_req_done);
>>  
>> -	mutex_lock(&kmod_dup_mutex);
>> +	scoped_guard(mutex, &kmod_dup_mutex) {
>> +		kmod_req = kmod_dup_request_lookup(module_name);
>> +		if (kmod_req) {
>> +			get_kmod_req(kmod_req);
>> +			goto dup_req;
>> +		}
>>  
>> -	kmod_req = kmod_dup_request_lookup(module_name);
>> -	if (!kmod_req) {
> 
> [Severity: Low]
> Does this mix scope-based cleanup with goto-based cleanup in the same
> function?
> 
> Looking further down in kmod_dup_request_exists_wait(), there are still
> several goto statements that jump to an out label for manual cleanup:
> 
> 	if (!wait) {
> 		/* ... */
> 		*dup_ret = 0;
> 		goto out;
> 	}
> 	
> 	ret = wait_for_completion_state(&kmod_req->first_req_done,
> 					TASK_KILLABLE);
> 	if (ret) {
> 		*dup_ret = ret;
> 		goto out;
> 	}
> 
> 	*dup_ret = kmod_req->dup_ret;
> 
> out:
> 	put_kmod_req(kmod_req);
> 	return true;
> 
> According to include/linux/cleanup.h, the expectation is that usage of
> "goto" and cleanup helpers is never mixed in the same function. All resources 
> that need a "goto" cleanup should either be converted to scope-based cleanup, 
> or none of them should.
> 
> Should put_kmod_req() be converted to use scope-based cleanup as well, or 
> should this function avoid using scoped_guard() to keep the cleanup pattern
> consistent?
> 

Fair, I'll clean this up.

Sashiko also reported the same issue in a reply to patch #5.

-- Petr
