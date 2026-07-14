Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3955328B7F
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053183; cv=none; b=fkNCzDFnJ7Knl49WUbpLxybCcVOYL1RoOaPECIbPYA57BoYi5HGTGBo+Nl245qOhj/T9ZTFLWju32jFS6FHzrLpgxMyeGkDU8t7r9n99fOwnDc/ApwyCauzRPmniesFo3B4YNLLcngxVm/hK4OuNhjsZjIfdgazDRqlHeFODYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053183; c=relaxed/simple;
	bh=C1sFBtxE69ioRh1QGckxAsEgc8urMOayeNMSZKFqcyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWhVRa5vUvCSxJ+CiexjX9mF/16DmMEJU+PLz8Sg1uzqZOoCfP279Ylh9LnfUXQ9jS9X4c0MOB/PDCXgPNmlXcKRmAHMZwVrXmeLEErPJpfuHf6HIBLXlAzTWfcFt+3y7u6Gz2gxNCxqcbvnR/J+T/9BfDCEoTTFLVe56AT1wws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saJ/2x+z; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saJ/2x+z"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84830c774a0so1094727b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053181; x=1784657981; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZW9BZhR1bEUCTQBEiW6Qsx2NvsQORDmw5UKJ5XbZAA=;
        b=saJ/2x+zrOaUv9bURMSWgcU2WBkqam5p03LJgDfpmerCmIhjr3e6G0mr+vUuDHQwgo
         k/9vcwUQtwkyNu55modPJh/zYjQup/oqk7FDV7WuJe5n2ZYBMAa+goD6udIqeaVPCE+P
         78hiRzDxh8Db1BOShMUg26DUmy6Z9Mo5r1D4MJjOK4Fohr9fciHdsM1MZtQxXc3xEWag
         bp39E3FZNJ1H4rbh4Co8O3wTD7wa21GMiwcE5Y+dYgzmXW+QCYz5hqVXax0eBVrVvnIh
         dz9sbNMqa0seRf/yvI1OqsduJyYXRWbu5azRxl6bmNYX4GUbvgNaKhVEjk4XcXDfZLzT
         uwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053181; x=1784657981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aZW9BZhR1bEUCTQBEiW6Qsx2NvsQORDmw5UKJ5XbZAA=;
        b=QGd3tbnf9+swj+JSAT4v4W3KPatIfbLw9J6o68fl/hsqF9GdfiCm+Bws6/d0Ym7vR3
         +23YJGB4xXjHuJ4DdA7JfNReEjNksSjbXFLA2jh/aYuSebZ6ncwO/WSWLXzXeqUM/WYQ
         +K++5HSYxqqSyJpuIjq8O+z8M8VSXyaAWiOHn1YHYZOG76gVMtApbZBPrIHQnpA8Ys7N
         k9vwrEZ/8qXvIHJ1up9LgE9zBPCYbrP9maJ8VwHMUcZ11YCAvStRbqMmegfp+7CBKvPR
         hCa85KpsEzxzRVb1+Zy764iA3ThkZs6G8aHAkgvJQzj70JnznW2kaLS63Ya2pYGXKG1l
         k4cA==
X-Forwarded-Encrypted: i=1; AHgh+RpJeySU4EwGhW5VGnP+A72fBUv+BeyfkvjW4FR3+THX8yDT0yGGOgXXFJ2cv+RI7eCFMy8ZMsqFpPsx5MCu9k8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsTEGuDNo32um1Cyr7NAWRoKWssCvBduoGChGM4FUv6uZxTxPD
	wMMJxzZjIWI4jV4fNGYihvvwJGxxK81KYMy0Kyrs5pX7igLzgr2zqyMx
X-Gm-Gg: AfdE7cnWVo95IwSF0lDsfbAIWwof/AgW1PR7pVSh5ysvqEakN63vyTZ1HAXUmXo6QCI
	N14ut0PShiFWdBZyIjUjr/ancLttS82i5uhlXBdLPIli18V7TGVLGZC6o4cUWLXVrrRR1a9jPqs
	5oJQn0VR23+9MmHMQTmwLns2Ty2XQ7Nq9LTEkJwLFjXmFV+WP5jiA6kFEV+qSsxNE/wKutHObmT
	3DsTJHKxR2eIl/3N8E0FeePs2Ur1fKl8FErZh94v0TFfzTgJFkm/bR+eswlf+0AVHjn2PvJNmgK
	9H9rtnusmElksid6felTUhno1GwkoqCOb1HOr7MiMk2FF5uRFKitanb3Xe2AF/SORAJ8IkaR5WA
	4K8JlnYd6dXrWJ07GBSS9Zp8uHXMoPALcwde6ANS2tftRezGR3A6zpuHw3b4Jn65neXzZ3nQdFu
	YR66YlsOsF1Q9gck7iDT4y
X-Received: by 2002:a05:6a00:228e:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-848896c39e2mr12654855b3a.9.1784053181128;
        Tue, 14 Jul 2026 11:19:41 -0700 (PDT)
Received: from john-p8 ([98.97.42.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7da667sm1855269b3a.41.2026.07.14.11.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:19:40 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:19:38 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Nnamdi Onyeyiri <nnamdio@gmail.com>, sashiko-reviews@lists.linux.dev, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, jakub@cloudflare.com, 
	edumazet@google.com, ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org
Subject: Re: [BUG] bpf, sockmap: spurious wakeup by tcp_msg_wait_data()
 causing unexpected EAGAIN in recvfrom()
Message-ID: <alZ9ZUWbUbVJuBmZ@john-p8>
References: <ak_rR-Skd8Mvn4mH@localhost.localdomain>
 <20260709185526.E4DAB1F000E9@smtp.kernel.org>
 <alFRK66z45eDNZA7@localhost.localdomain>
 <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>

On Mon, Jul 13, 2026 at 12:14:07PM +0800, Jiayuan Chen wrote:
>
>On 7/11/26 4:17 AM, Nnamdi Onyeyiri wrote:
>>Hi,
>>
>>The updated patch below addresses the issues raised by sashiko-bot.  The closed
>>socket and signal handling code was added to tcp_bpf_recvmsg(), and the fix was
>>updated to work for sockets with SO_RCVTIMEO set.
>>
>>Please let me know if any more changes are required, or if the patch would need
>>to be submitted some other way, I'm happy to adjust as necessary.
>>
>>Thanks!
>
>
>Thanks for the report.
>
>
>What's your use case here? With a verdict prog attached, we'd normally
>
>expect the data to be redirected in kernel rather than read back via
>
> recvmsg(). Are you using SK_PASS? If so, please state that in the
>
>commit message instead of the email body.

For our use case we never do redirect or packet operations (push, pop)
we merely use it as a mechanism to read data and possibly drop data
if it violates some policy.
