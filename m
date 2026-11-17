Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913618;
	b=5iE3o9PZCAUNemsTW9KjMNnxCWGUjBHMDpzgw4qZsuFUS8owVjae7P4gvaqIm7aqp3k7
	 84Xmna3WYC/o/6DTeOI9Tk+MDvMxMw6fcplc8/LgrX6ZK3Tbxpoculka84V0Y61HVUZoU
	 hjUAwkRECQZ4fDHMvrNh7bBA6Jzg2PNHvTUBIRGb9MyjbM6LyhfdgE/Qks43+tpiYLSDd
	 +whAiwWxVnLYgMy+pEsobGGI+7U7mRo6s7ZAuV8thnx33sl7cKck/wd8LErNvLwW2qnVI
	 6tXnKoQcVlJ5K395SZ/ZSd8PSrMwdq7hFTtDcVLqaLIg3lTuMhPbIz85OPgS8+FIvEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
	b=D081jdWLztBcoRGG4PQ8dsxG/NUvhzhFUDcbxZrblbJvCJrBf6fEePQmIx+/vgabAAlo
	 S/kGoYL2fYbaLrKgtTimEg9u3ApaYZmdwpLZxkkn2ODV3gZU47xmatC+x3RBDQPH3WYr/
	 mQCNOH+pmAXuHVlMWEgAg2jxX5eDR9hUfRXbmnEzqYqj51Tg3gflYDB0KpS+xRbSByQB3
	 H29dC+JaLY/KPay2NHIZmw81mSDbkkPzvkwxIeQJ566mqY4iJCGbmGb/5TN2zl7zEoc8g
	 fpg+5WL8k9SuFJi4RkPN5/8/HsPomawDhMpx4qnf4xeNEcpI39fny6eXn8PZT5qZo7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRi7Pif1;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30282606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 11:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30282606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRi7Pif1
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49134c8509fso4285867f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913616; x=1795518416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
        b=dRi7Pif15BY0Rsq+0ZQmBE0BFLnYQ9lpIqd20jR1zbiIXRiqKRVHpl6y+JjkBnruqj
         iZVQ52/25tT2BX9eeT3CNH5kX1f42M4NZ9pDXXPCL5tsz2kW5CgC3GYd633Hs0c26j6N
         8tRBgI+XrHhbHpp02apYKm85WyH+ps7mL5u8rMGD7uv05JiSacEB0Uol3FCDVCbF0OQx
         espr9MeVPCB33ZnEc6JUoscuptqqndTYOXvM9Smmk6akY66rgodIntnjKzGDmGZGNtsZ
         lVCH2ID5tkIFpK8NTmoLsYu9ZgfrX5FfWK7G/dXLgJIbrCgB8BmWHHerEwnDnJDNnZ1m
         jfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913616; x=1795518416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCYoCA0l50BOe6cq00vn96utGEICr0hjnvRC24q3j5Y=;
        b=BaohGPIfSKpq26mYtMlz1OK+AIWXvW2+ZCZ1QA8H7VK32zMaI4ePTQOnzMHldQMEkc
         T3SL1UN4Ktwq7o3RIACiFnq1KT/mgW7aX7JpN5cRTta0ab1YHvaCIFyqS70LuxiLHSG4
         m2sAckm67toN0zBRgYT9Ql0UFcjp1QGkN12qEPbfGJPnj+eMDev31CIDMVDrwOFqBkrc
         NoWiaoPJAU7jOT8BOcECZXhKf2vDzy6tfMJBrTDe3cAGYyP0cTPcSfGptFCfX8la6lCn
         vTV8vxdYTxAx2YxQae6pMNng5BtWa3TNU2PZVLArFwYostwo1tkZVf71qkxfNOop2+qF
         4mLg==
X-Gm-Message-State: APuU4Z9n8qB4rIGXeyrZGAlqiSOUVCL5YupwTlX7BB0eT/84UiTZdFKA
	b0GCcmk4Z1bIY/22OmEWxLss8GqPIcKcticvjo/jAn/JF8gQJG1o25oI
X-Gm-Gg: AZFdTZdSLLHigm3kENuEV3dGsDma0ruw72lFfTo3imsf0FixPpAcpDvkxuo6eBaK6Kh
	q6/MMksUhUlBF72n+j9W68gA8PqAwPRZIVvsa0/rEn64Rd1YemVoKZaPsI6rB1TGKdtGPuBPddU
	J7Pqjia9qXWs00LCm6iGjYGR4c1/PRMYiJDfSYwWkQ8EPWndJqJ4z9/5yn/K1/xf4b7AMVUEBe9
	mrXK7IzBxpXNIa+j4JzXvhzRK5p0ZdrRX/+MG0Li5aRsrNVV9Hn8NaAKauO2Yxtir2xsW0Il/Rd
	HzQgBPcIeYBYFHYB1IZzt6qCq/NDK4vi43+dOrOIQOAATOhFDeYnIpmMLkla4SMb3MDxR2vebF0
	YQpHVEApxS8nr1WZr0UOKsiOcCJtK5NT4Yl0y5lbcHUKvljg6ZLY3bUIDmQgzA1iVn9KYfPmgwt
	42BJNRCXQUlq8infgOTzZOHS8JSOLpQBfCX4gVvvH9K4X855FwZw7wNa0dPvMi89W/trYU6DH0p
	IhGfMhP20ViXmmzqu04I/3jXnFFId+hYEzwHJGccaixfbGxHCu998gsc9+ew3xUynmdm6hpCtpo
	6qrtFaPFDsdL1JrNjEQU0b/EKf2yP0LWtu+G8hyL0EtoEiY/UEGY+m66QQJPDd34mA==
X-Received: by 2002:a5d:5d0a:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-49c72e85578mr29909972f8f.45.1794913616294;
        Tue, 17 Nov 2026 03:06:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm22300526f8f.53.2026.11.17.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:56 -0800 (PST)
Date: Tue, 17 Nov 2026 11:06:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v4 next 05/13] kallsyms: Fix selftest startup delay
Message-ID: <20261117110655.1294a95f@pumpkin>
In-Reply-To: <sashiko-outbox-218653@kernel.org>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
	<20261117103352.1244657-6-david.laight.linux@gmail.com>
	<sashiko-outbox-218653@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 10:40:36 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kallsyms: missing Fixes trailer for schedule_timeout() bug in
>   test_entry()
> --
> 
> commit e7ea6257d7756e16690d0150d840ede1f6384772
> Author: David Laight <david.laight.linux@gmail.com>
> 
> > kallsyms: Fix selftest startup delay
> >
> > The kallsym_selftest code clearly intends to sleep until initialisation
> > is complete in order to get more reproducable timings.
> >
> > Replace the schedule_timeout() calls with schedule_timeout_idle()
> > so that the thread actually sleeps.
> > Poll every second (not every 5) for SYSTEM_RUNNING and then wait
> > another 10 seconds before starting the tests, otherwise the tests
> > start as soon an init is executed.
> >
> > This code is in the initial 2022 import of the tests.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> 
> [Severity: Low]
> Since this fixes test_entry() calling schedule_timeout() in TASK_RUNNING
> state and busy-looping instead of sleeping, should this include:
> 
>   Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> 

No, selftest, doesn't need back porting.

(Did I say that before?)

David
