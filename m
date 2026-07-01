Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851A3A257E
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 22:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946706; cv=none; b=G6vaurtPAEznT1YEmW2ID8kA68fprWNZgHAFIl/C/1pRIkTyT8eANb1UDHQDB/At3iZFPDgISQeOjUdZ3kCxNcsI8ubFJ/hWb5asftKjVQVDjmt06iZ7npgbZQf6e+b9ktP1EvwfeYrFVtYnNC6M5a393mSFj6xOcV2vDXx0jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946706; c=relaxed/simple;
	bh=bUDYuKYHtQmgldv9vVNnWK4B+5v8BcuM1LLff3DuZEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3s8166iMFc2JEbhSSMUAboSbuPNt79sKOPG2YcxLDtxslYSj5L/pU9v0QBDHpZpnBrVZCHSHXpWXywfr8zeCykAT9pIYVI5ZAqFVa+hhglFQNNxs2D36aXx6jxgY05AkwpfndgdlKbc2iVQx6JEsdwU0fJHNGe7PUFHKiFZ0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjtlQ6gp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjtlQ6gp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9d265355so751705a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946704; x=1783551504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=De8XTkFmbzVQpV87okqkWkxOfLzf9SREnezKw2Sjhrg=;
        b=KjtlQ6gppxh1lZcuF9EnYd0AGj8uPlpoMhkewVDyUbrRft+W84FBdpa5q+mx/VDW85
         my7rnKELcjoZcDzVG0BuS8AQ5fQykC5UnFPtzkJLxsVknEOa+Zf63jPG6KthuDbD70oJ
         YK33pcyfsf3nUqfrAx5SoJlZIiPQwuJBJgHc1S36lQJdVRtQFfHB4xiRusuiGg4e/epp
         hQVLr4xTZ5jtAVjv5TuXjKkKkpCQhRUpi5wL+wj3KxMLlKQdxye3VfFPImOB6vLxh1tk
         bgnEScrJkd5a/c9SIfsxdDO1kt/eawiFwsXuApHTuN4DzkEXBiCdFXxOiX11VaBP2K7B
         tNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946704; x=1783551504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De8XTkFmbzVQpV87okqkWkxOfLzf9SREnezKw2Sjhrg=;
        b=fxMHb3oyZjqGZT5crkq++UKPHwUeMHvgzUApGclg9zaJ8/+WbmzL3Do7WE5mULMs64
         jiDtl/Ohx+2NgRKCVz54UWb/lCWItc6JA3bBkBoPhfmtneLA7HVf2TVFSAb7r/sf0j46
         LOdrIC8Q+kW2bVhLilEN2M39zYch6skjVBX/V9cfpbQ9Nvl8cLuJ9RWbaN6pghvNbgez
         3mrj0MBc4xHJsX3f1FrOkmrybWKbyscv66dZjGGEL8m0/RL4SYxMPljClI2x3ahMg1T/
         dgEf7UXswaICV8Fr+GjPzUo0CgHolWyEWMDitIlgMKqfseIr3h16JqvbXnTJU67Cm3Hk
         OqqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro21+hWF2dijxjH483d37nUnSENwig0S9pNLr0rIJgfp7nmlVZCrU/dG1cGouoJ0d5ZN6thKwTwJU/g82H2dIs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfcq2ETWnR+xI3wYEy+4hviDDMiUp6gOXrBNAu8rRmIuKG2juY
	mcezlqsyi0v8Vwg1kxATuBSUrOEtFguss4kiMlDhAzIUCNbD5FzmQG58
X-Gm-Gg: AfdE7cnajHCRWeMy0ddTSEumtgHJ0KLD2GiHA168HSBVhh3OzfHGJE69OL8xuJpVDVw
	HklPd3MkarzfySp3hMoyX5Mcn3WMeiOkO8VuGrCEf71q48Vj1mHnjl2mArgk0v9yJgv9Y6XBaqA
	BUZj5p/CkFJ7lpI+ss416qlM2LqwhNf1khYphynhDF8qG06TxYg4XbCga7pgprAtD6BzkUgkn5F
	QUrpTk073ParIrZPaEzXMU9wgEgSIOvUh8k3xJdIFHjuLKlxej5xgxzOdstjEwO9NzyaxW0KsjT
	K/H6D+xfE2Q/iyHrvm4/X5hPs0ubADas6wRnuMDGDfWew2XDWJjbDVtSOFl2r4+SryNmeRoRLP0
	LboFA16GWDkGA+8GPvyZYFtltFfdJuznTzHe66eeW/RnzJRJ7yV3Tbrxof7VY2cSB/Odhx6yFMl
	GwHMAx+atxpw==
X-Received: by 2002:a17:90b:180e:b0:37f:ff9d:ad69 with SMTP id 98e67ed59e1d1-380ba80c706mr2735930a91.7.1782946703866;
        Wed, 01 Jul 2026 15:58:23 -0700 (PDT)
Received: from john-p8 ([98.97.43.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380def494c5sm99877a91.15.2026.07.01.15.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:58:23 -0700 (PDT)
Date: Wed, 1 Jul 2026 15:58:21 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Michal Luczaj <mhal@rbox.co>, sashiko-reviews@lists.linux.dev, 
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
Message-ID: <akWbSP5aMxLYSmM8@john-p8>
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
 <20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
 <20260626205814.BAC3C1F000E9@smtp.kernel.org>
 <e08be4f5-0bd9-4228-843d-86ed20594bac@rbox.co>
 <87v7b137cx.fsf@cloudflare.com>
 <26ecbce0-48ad-4b53-a0b7-34b59870e010@rbox.co>
 <87echn2fhd.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87echn2fhd.fsf@cloudflare.com>

On Wed, Jul 01, 2026 at 12:04:14PM +0200, Jakub Sitnicki wrote:
>On Mon, Jun 29, 2026 at 11:40 PM +02, Michal Luczaj wrote:
>> On 6/29/26 13:37, Jakub Sitnicki wrote:
>>> On Sun, Jun 28, 2026 at 11:59 PM +02, Michal Luczaj wrote:
>>>> On 6/26/26 22:58, sashiko-bot@kernel.org wrote:
>>>>> [Severity: High]
>>>>> Could a memory ordering regression here allow unbound UDP sockets to still
>>>>> bypass this check?
>>>>>
>>>>> In udp_v4_get_port(), the flag and hash are set:
>>>>>
>>>>> net/ipv4/udp.c:udp_v4_get_port() {
>>>>>     ...
>>>>>     sock_set_flag(sk, SOCK_RCU_FREE);
>>>>>     sk_add_node_rcu(sk, &hslot->head);
>>>>>     ...
>>>>> }
>>>>>
>>>>> Because these stores lack a memory barrier between them, could sk_hashed(sk)
>>>>> return true on another CPU while SOCK_RCU_FREE is not yet visible, allowing
>>>>> the leak to still trigger?
>>>>
>>>> I'd like to verify it on a weakly-ordered CPU; please give me a day or two.
>>>
>>> False positive, IMO.
>>> Both ->get_port and sock_map_sk_state_allowed run with sk_lock held.
>>
>> What about an update coming from iter/task_file? You get an unlocked socket
>> via bpf_sock_from_file(ctx->file). And sock_map_update_elem()'s
>> bh_lock_sock(sk) doesn't care if socket is owned.
>
>You're right. No exclusive access to socket there.
>
>I think we should block map updates from all iterators but iter/sockmap,
>where we know the socket is already in the correct state.
>
>This is in the spirit of the API lockdown that is in progress [1]

+1 lock this down to just iter/sockmap allowing these updates from
arbitrary context is too hard to reason about.
