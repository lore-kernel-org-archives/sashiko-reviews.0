Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754360;
	b=ahRsN4yYEsT8ZDxby1UwjBGF/+5Nwo+oC1BBS8SdQ9wIS8ns7xfxS5YRneEhewUkqNXi
	 NcXSMxKVJ8+biJZ8cMlkXPp8I482duHeu56r7OnDpv5mpeggTx08nFBsE+R9exgvTkOUq
	 VtcNJ8qIW/g3adKsIX6FAJ89k1FjS4/YXnf1dXa+fBS07bz2PPLTM2Afy770PGRCh2WAE
	 NQXblxtfxpY9m2h5SsuFp+cVNpqIrrwpNwYRlO6F32B8YZGdRL5gHv8NiOfnjMjlNUUa7
	 0v8Kbc/0N8/WLMxXbxj4/LxYpr+rW3oDZbdwiks7LVqnaKX8OFoDeK/oJ7lsA7FZPEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dqWRL3kzjldEVQsytjD7h2NlJccwDqbt2iS7/1Vy0To=;
	b=TVq2GtKBYNjkVjiwtKe5CVtIOOynHhw8ISinx0uhXrqkVZGXyPEIEcZiAYK0afqLEF11
	 s5DUX8/45qnqcN8PtJbebZwmzh1asGKstj2h1PbNwTlglccrXOlmO9En893kmn+bUsoVz
	 M8W1na9d0Nr8Kbxyx8ksKgb5v3YNiUJ6/Xo7I8HZ10S3LMNsjqI90YwDoeL+NiTTkNkFz
	 TcNjaiE59NDV+T7tgEx/TwP1/RXo7gSGeTkaqdI8m/v6MkGoSypOISpLKHnF171vaiCDn
	 agHOqdZkWRKInDeWSmai9Eh6wUeaEmbWFf3Ib6wkDCCxLZczEW0JYhKxnXE9FSCgcwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9dsQswd;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF15606A326
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 01:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF15606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9dsQswd
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5378b281aso900245ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 17:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754360; x=1794359160; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqWRL3kzjldEVQsytjD7h2NlJccwDqbt2iS7/1Vy0To=;
        b=D9dsQswdljEnteJADjYPpY2DdEcvT9zma1zYdNVJySyk+jab+u13vQvHsOPY081UYR
         CjFXSYHCwLhGssccj0yD42CL9Fd6XUXkVSSGK2ku+kaDiHGx9qOUhvcD/6byKX9bS8Us
         aSwITysgEiparbJN7ymG5tyfDwqIvaJXU9OjddUl16aOSNKDJfX/vdOVB3vAvVf4fGT+
         Aa60mRxOmgWEdbELutp9X/bK9VVGd1SlpZLQx/zfmjbT/yM08SNKUDq/tu9wmWA1sDkJ
         xRCToIu2LDIldU2cSW+01aP9VvD2srMnNnQSYMwetnav1Zj8lzdrWHQiwit3lrZRlg9B
         ReVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754360; x=1794359160;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqWRL3kzjldEVQsytjD7h2NlJccwDqbt2iS7/1Vy0To=;
        b=NkhS1P6TETjqi93ACFNkR05qX4qwg83QEm2Kml6mAzHi9p8dI0tx9oMaLztzVh0gbM
         NeUDmWHws9BhxFQjV8H44X4WVSirabnQAVNBwHi4Wdimd2XitX5SV/5BKLVMJKlGefql
         +g5G2ruxV95FcMDaCiJTJFZdvp9cJAqPjKZOselQy8GWeGpKDtKn6ZKBqTGDI6ancqXn
         yjs/7kGB2LwYMCql/2g3fwi2+bfeYoTNH2oiV5pQ/Fs8qIphb4drAKKT12cvVKQe/+7P
         Gbt6tWOhUJu24v2lhpEdVnolioDyX5mNaz+qR8RmP3xMZIbObnycGDCNACocHrtX0HuB
         3yXQ==
X-Gm-Message-State: APuU4Z8utCKiCGMsgO+OTYEJqStB3lQagHySN4SQAktXK/fv78AyK7vJ
	+5LVUKegqTFm3zLRaZisOqSeDsdmxJIiaBmb/xFauGeBnBujnChNGa+jCWpr4w==
X-Gm-Gg: AYBFou3Hb3KDT89q9a9y6ZXo6zeXSj2yOYd6ye2DPp4ktDUnErBGjL8AN2m5bTCbZ7K
	MSs/6sqBD18Gxy/BstAERuHdiHTRsayklnSMWOKvnWOHeBRstE9uWm9z4lTAeUTxCIOKTlne1fJ
	Y/OFizSEf+WiSwv4eK29zXElvfU0Y6bExP8GsRVkwqQsdj3IkOme2HxpaO7U543CbL+gdlS267U
	5J8qv6S6w02ZyPgDokUnGb0HTfBxWh4oN9d5S58LowJxAVfxMYyOhGyd2157TT7kf3IA4B1Y6ia
	v19AWjZ1GmKYCj8OYcdh0rBDr4ZKy8vLFmTLRXzegTWC6hU51S9pXFvXT4SUGVoNJvOUNuVmkM5
	4hxA5jNo9abWv00F58cFdw9Yc/ssmq9JKPRdbxFnFzJFllM/HYeFmIrPYLbtKyPB57TKjhpcsxR
	st6XOFszfDzStm0NnavOWjQTv0CDyxm9lZcGdMSg3dkHAwJyiikH6XEDQv3kUSfrR9zeEt/yI18
	GU/fzBBKNY/PM44nahRkrxQ0se7gIFijadpBzRDF1F0WTXOWfw85z5MAL+YCTJrWsZ2PtU584Bt
	HMNKAioapTCM8Y3IjqrceA296Htb7BBCoELbapAOjhx1OK5hq+up49ljGlbviKzOZwud/b0F1tm
	TKhfz+DJuVNxGmWS2DnNjtN4y+lBmxFYsmg==
X-Received: by 2002:a17:903:3905:b0:2ed:948:b68 with SMTP id d9443c01a7336-2ed09485cf0mr4864445ad.9.1793754359453;
        Tue, 03 Nov 2026 17:05:59 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4fc8sm683015ad.16.2026.11.03.17.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:05:59 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 01:05:58 +0000
Message-Id: <DMM0UOCXG7PW.3UKUR0B47193Z@gmail.com>
Subject: Re: [PATCH bpf-next 16/37] bpf: Count loops whose first value or
 bound is a range
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-196303@kernel.org>
References: <20261103234104.208239-1-alexei.starovoitov@gmail.com> <20261103234104.208239-17-alexei.starovoitov@gmail.com> <sashiko-outbox-196303@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 04:21 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
> - [Low] bpf: iv_bounds() leaves bounds->r32 un-narrowed before log_bounds()

Not worth a respin.
