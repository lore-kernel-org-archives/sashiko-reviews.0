Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101031;
	b=ZfLSW2bJkbbyRi03raKhxaXNLOjOVnEQBxCHRfPm+aBLHM6ed7r0J2rD2AlWsMZ5MWCT
	 QtapVIig6vuCJ3nad5ZqsdTzr+bxg+ZPwJKWe53W2srMG6Xdfo27o4Oqwyyg2/G+I13bc
	 tDZCde4zhOC0/+bPoGc4xYxSO/u9iZU+J6Su3sJFGAyK8A02UpcbLV+VGz7jJ8/OqQRh7
	 2P/HcjCG1jRCy6sOD2IxQONmA/cqilbbgaEgzX88erodpnevIqc2uxG86kCNAcbgW7dt9
	 uTUcacYDDjfAwjAB1XhSsz9+vnTzXxF9WlaEw8OrULccHeE1PRsk6mWiIRedogDqijA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2PmdBMJLldvL6rUsB8Z9mUP9W+rlN8TqadiI6ssq/LU=;
	b=ONG/+zq5uxtm8DDrPyQQJEpPaKYZhI6DNy4Dv7GGxIhlZSUe60+0oOfoeska8nUdkHES
	 qqFnFTY6T0C/zeBl1hiLre5OFU5LurzYOfqgjVdY/WoLQnLuPbG4Tn6GAQ/R+rSWIQ281
	 A16N8rv2LpJR6AKAJM5B1QZ8pitGEH+K9+3rhFmKTaxvDT6lUsxxb3hYHEu1mCQr+rfzs
	 gbksmbvh0rVh7j5O11ZCfxF/dPl6Keo+yzaAIj6ZW+J86yrWUbTg6sKvXMHg6joAaCOOJ
	 VoaCqviLQ9DZ5xVlEhkOj8BTqqSvV4kXhEHOTNuzZTBmVYVJwNgu13XCQLAod7NNtog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Rj6l5PFb;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF6606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 15:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FEF6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Rj6l5PFb
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so24682315e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 07:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795101029; x=1795705829; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PmdBMJLldvL6rUsB8Z9mUP9W+rlN8TqadiI6ssq/LU=;
        b=Rj6l5PFb7afmpP2cx/rjtUOdSzvRnQzhnCC17leAMz4mOvw8vTVwNfEnQEMx90Zn+O
         og+kc9sig2f9NoK0u8U5aRjLwEJOB5jQtJBqRCPzTHOeokS23yUn3swDI0S844cnx5wi
         p4whB5lgu+PLrtgKRCo7EHEvY1fNNMqTCQkrvncmUuXQwTwT+cxXuFl3slalxmZ8gZRA
         ng2cBFxuIV0WDrodUzhDibkK268egAAawa7a4xjSHyOjUO8JnuLGA8m4/2DE3Eo7Lh8L
         7qMRg+lawkJmJWq87T2mlpybxyd+ta0B97C3K6OO1nklX+RPKyYnh+ho0xYqbhCep/bw
         ioVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101029; x=1795705829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PmdBMJLldvL6rUsB8Z9mUP9W+rlN8TqadiI6ssq/LU=;
        b=YUO7upPb795MU/NrPqV9+Bua66i6qCbtJKkUep0aS0knlc6uu+6TabzaqNotBCOPG+
         bUCcJ6ASKOOg/HYNygUmLBZ5x/Lp3dpw49WPJcAISv3x54skD3WoxXnbx45RWCVtUNK1
         PXnYkSWg/2ppEDdQ9YaxnLL8WigVt7wFvPAGaH03fA88xjYMsW0yUm1VWpyPiD64T9V/
         yDKLxKJtQl5WSJK3r1bW5iVx4uGtM9J0/T3lFHGogFFN5g5tmvBOpmUuJWYCmw74gYmQ
         4Y8w9O0T6h4XXc510HE++17XvYyuG3Et+nIcFpcXinaVIJyN+oZLy4n9KZ9mukO2XiQE
         DJAA==
X-Gm-Message-State: APuU4Z/Vl1/csP+rRTVq5Y1b4V/Wa6isE5otZsZrWclhPla5ea2RBnVj
	4vVpOPPUNEgqUTMVgtN2W2urU+BNDtDKKI+G2wkBx6QsGaTipdG56eKwyLgseahyAF4DIER6DSO
	RmfvFAkY=
X-Gm-Gg: AYBFou2JRrBz0vYHqKLQRbn5JAcYJLXIPSI6/TCOXsOlanFoxcx9ZumQABJdWEYawlf
	Y9vEY68hxDsIPGitL7VMCyk5N6btQsP1st6M6H0nmyh8FY2g1yPCx/REH3veOohwqAJoZSDpsZC
	RXvsmAGKwzzkTFNM1Mi+6toCEycublEz8GB11L0337AQNoCvS2X5tmd3xJY2aJmJCCq/lDo3nN0
	l9b6Ur9CY5XIUGS1+BOYNHHQ5X7/ku/TXymgAjztz5qsweMRbHnMIdOu6UEWKX+a4NpV1MCQ8lQ
	A3OcHnh5hpDHpNKd6z+qnuEW/IhcX6t7jsFTfbKjUEyflh7HDTjv7L+Kt8HGvEEIA5sUl1m/uu2
	kJzsSX8RXngkLtbKHrGBpzdvAybR3N6JIJoBR5njtVUqPlo7GTWRS9KwNTmISciQYPAp+64FAfh
	QeNbOwSwXYl4oV00zyZl66IdwuqFWvnaMl2X6l7bugQteFy3v04VnM/7uI9HzYsCo9ZyCKWanGz
	wtRnA61Q2Dl1uil17MKXGnfcu2Im9vBH23Yoj/qXL3eFV1ItDPtqP3EMhgZ/5tNFWnATN5D7VNa
	+k51aHHDG1IqgASsDK/fHh5Ef/5eJhZIqDUB8zA55++MPz69ZUrba0CJIBs1z2QQ+w==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr128058615e9.1.1795101028949;
        Thu, 19 Nov 2026 07:10:28 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm4229285e9.13.2026.11.19.07.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:10:28 -0800 (PST)
Message-ID: <2344f228-f6fe-4b18-9587-53063f93de50@suse.com>
Date: Thu, 19 Nov 2026 16:10:28 +0100
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
Subject: Re: [PATCH 2/3] module: Fix data race on mod_unload_taint::count
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org
References: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
 <20261020-taint-unload-v1-2-d1c764889afc@suse.com>
 <sashiko-outbox-179099@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <sashiko-outbox-179099@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 4:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] module: data race and uninitialized read of count in try_add_tainted_module()
> --
> 
> commit 742b3a34fee074246edb757213ccfc148f6e7300
> Author: Petr Pavlu <petr.pavlu@suse.com>
> 
> module: Fix data race on mod_unload_taint::count
> 
> This commit fixes a data race on mod_unload_taint::count between updates
> serialized by module_mutex and concurrent RCU readers by changing the
> field to unsigned int and using WRITE_ONCE()/READ_ONCE() accesses.
> 
>> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
>> index 061161cc79d90..70ef20b97c84a 100644
>> --- a/kernel/module/internal.h
>> +++ b/kernel/module/internal.h
>> @@ -257,7 +257,13 @@ struct mod_unload_taint {
>>  	struct list_head list;
>>  	char name[MODULE_NAME_LEN];
>>  	unsigned long taints;
>> -	u64 count;
>> +
>> +	/*
>> +	 * Number of times a module with this name and taint combination has
>> +	 * been unloaded. Updates are serialized by module_mutex and use
>> +	 * WRITE_ONCE(). Readers that may run concurrently use READ_ONCE().
>> +	 */
>> +	unsigned int count;
>>  };
>>  
>>  int try_add_tainted_module(struct module *mod);
>> diff --git a/kernel/module/tracking.c b/kernel/module/tracking.c
>> index 5bcd1c2701f07..873fceb305268 100644
>> --- a/kernel/module/tracking.c
>> +++ b/kernel/module/tracking.c
>> @@ -28,7 +28,10 @@ int try_add_tainted_module(struct module *mod)
>>  				lockdep_is_held(&module_mutex)) {
>>  		if (!strcmp(mod_taint->name, mod->name) &&
>>  		    mod_taint->taints == mod->taints) {
>> -			mod_taint->count++;
>> +			unsigned int count = mod_taint->count;
>> +
>> +			if (count != UINT_MAX)
>> +				WRITE_ONCE(mod_taint->count, count + 1);
>>  			goto out;
>>  		}
>>  	}
> 
> [Severity: Medium]
> Does try_add_tainted_module() in kernel/module/tracking.c still have a
> data race and potential uninitialized read on mod_taint->count when
> allocating a new entry?
> 
> Further down in try_add_tainted_module(), a newly allocated entry is
> published via list_add_rcu() before mod_taint->count is initialized:
> 
> 	mod_taint = kmalloc_obj(*mod_taint);
> 	if (unlikely(!mod_taint))
> 		return -ENOMEM;
> 	strscpy(mod_taint->name, mod->name, MODULE_NAME_LEN);
> 	mod_taint->taints = mod->taints;
> 	list_add_rcu(&mod_taint->list, &unloaded_tainted_modules);
> 	mod_taint->count = 1;
> 
> Because kmalloc_obj() does not zero-initialize the allocation and
> list_add_rcu() publishes the entry to unloaded_tainted_modules first,
> concurrent RCU readers in print_unloaded_tainted_modules() or
> unloaded_tainted_modules_seq_show() can observe mod_taint and execute
> READ_ONCE(mod_taint->count) while mod_taint->count still contains
> uninitialized slab memory, or race with the plain store setting it to 1.
> 
> Should mod_taint->count = 1 be initialized before calling list_add_rcu()?

This issue was addressed separately in commit 7a5c13cfdfcb ("module: Fix
uninitialized count read of unloaded taint tracking record") [1].

[1] https://git.kernel.org/torvalds/c/7a5c13cfdfcb1871050fdbe00ac223993f8925fa
