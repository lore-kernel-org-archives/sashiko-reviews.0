Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F053F7AA9
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197494; cv=none; b=AAqXTF+T/xp0w7PjD7P9OPtFNkiALBNf50uKAvcK9CaPV7MdsztR0twAprgkVVTj+ggzLYafachy3jEH/w2xciVkQ5ipjhTw1FEZZ/YxT7g3C32OjrqFiAmP42DmPtd2oZFw725YrDK50rY9UMt7PViseX1DwpLZUKfStD+cZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197494; c=relaxed/simple;
	bh=YQ2tL8/3Hf5qXAULGtO+Ag9ODHc16ddEpEO7Jjp5ZnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8CbfteV7BN0crqxACXdqRoj9ac+8H5QismcxM1T8/BdCEBhzWKrGZtcKCOnapO7Q54jzFbiBv8sHgQ4oxhh4VKGBMYL3pTqIDnvN+l4Iuzwpos689aG+O6F+lHbCRW9n26lEJsjmOe2PcbXk1Tfgs6eW/xqk7XhcOClBG0pvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEIqPiHD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEIqPiHD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so2354999a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197492; x=1784802292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ+4p9deZ+LD4EAdCpLpzHGmysHFbTARhOqZpB3AIhw=;
        b=pEIqPiHDkpEUUN3vNWNHSzyNAB0J8+g0b8aNw/Mbt3ciU6ZvVYoZYZAAdUExWF/P09
         dYpJxS6hEF39YRRGG/PiMJAhZx6TRgSSaMMMsXzuSRIN/WTnXD5/GCo7TF5rd5xry3DB
         fYKKDptU/Og+HHOuIXH37fFtIP5O2D4OdF3jKyECjx6xNqaYdKrz8X1ONI99GBiaR1TO
         WrujBRzs43y1H5LKfW1e3L33i0WMQbxtptWOszNj7ECzHVeMwOI9m5MfVxIen/u0dCcC
         PW1Hw+oPR+svWWCcyLz4D7fHebwO3fZvJi++937rcVCjrtCVh5ccji+oiNHzjX29E9wp
         DaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197492; x=1784802292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ+4p9deZ+LD4EAdCpLpzHGmysHFbTARhOqZpB3AIhw=;
        b=tICx/04MBJr9SjFszWwxFoxieJGII0RoaJMlgKlH14JebU5DDjAh2Av8jOvvLxruTP
         7KvEX79Ufo5PlIHbKCAyx24YEFlQVL6AAoyhBj3B6AfuJ0vQFrGZEem76isYYTL29ewk
         PNZA9XjtMFkE/0sMT8UZfwcJJae3x3BWbBphWYnt1perU7n9dPdrm6YDOZ5/cVF09fCj
         nR1h9YLQh01oLf4pVdw7rI5sLMnCXTSC168GiLi/qcngvufycOJtd0NbkBxCgWAD+YjF
         bxQVTgHdSubyda4fPdDITZuWqEd5s6LZ7nHaO8Bffo7hjiZf6vBcCtEBZsxAFvzQGojG
         Bu7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpOy12Y5twuyR3E5XUDC5kNhsIRMUQf+emHRsVK3SLwQFbhICRPOFFP+YSNDuMgA+BWb852fzTZ2KMUBD0Ga/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAs7iSj2vEDJe/odLv31T5avTbhrkil3Ylt6HCZv4waIIvz3t8
	3EqaeKNK2wMkJ8SJbsUiXk+RmjT2SfItnGsSHdyLRzHLaNn4voM1d9kn
X-Gm-Gg: AfdE7clgTjS3bfvSKR6YCG2hFZ0pC8oHte+O47xEbYmIZKQJ4gCjnJxku1ruST6feIX
	cByOVA2TAxUGxcjZObTqWKnClhiV1oGGaHOVUoPIDrOq6PoE5GWZpjAOr4O5lHAShsnAU+y09+Z
	rgLUa/fLo1FpePAuWZR/Gr/yF1wz7N3zkU1hpUTR0bViEmQQHRgrIqi4JoZD0b4U9M32g5gxS08
	RGq/nU5As5C9pSlr+klz77TSe5BTxi+vsGU8giOdT5WK/ymjlBZAB2sEzdMo8h2AgDSdkxRnfwW
	9clqMWrCUqlFZ6NGm/AwpbPbpmXgu9hnQFUE02hCKb9XhHcIfMv4XlrNGya8GjRwPmZBTCsgthi
	krWWj6LABVm2ZotR9AlOAJjFSuoNC81IXU+ZKVIOOrgHot5pKMP49eKInK8O64Kh9toU3pJGSAA
	AmEWaOnaaqXfS/q+bgMQszjI1x0Xq0xK5GO01OI3n49rRiPil6skwkIojcn1qkDLrvag==
X-Received: by 2002:a05:6402:510e:b0:698:4992:77e7 with SMTP id 4fb4d7f45d1cf-69e198a6b52mr3660369a12.7.1784197491403;
        Thu, 16 Jul 2026 03:24:51 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd289ee36sm4359432a12.11.2026.07.16.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:24:50 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:24:48 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jakub@cloudflare.com, john.fastabend@gmail.com, kuba@kernel.org, 
	kuniyu@google.com, ncardwell@google.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v4 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data()
 wakeup
Message-ID: <aliwTlOayzvvlN10@localhost.localdomain>
References: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
 <20260715213538.37229-1-nnamdio@gmail.com>
 <95e690bf-2eed-469f-93ef-6ae3fb2a7162@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95e690bf-2eed-469f-93ef-6ae3fb2a7162@linux.dev>

On Thu, Jul 16, 2026 at 09:30:30AM +0800, Jiayuan Chen wrote:
> 
> Please do not send a patch by replying to an old thread.
> 
> ...
> 
> Please use a commit subject like "selftests/bpf: add selftest xxx" for the
> selftest patch.
> 

Sorry, I'll resubmit with these changes.
 
> 
> Please use existing test frameworks such as sockmap_basic.c or
> sockmap_strp.c.
> 

Just to clarify, do you mean I should add the new tests to one of these
existing files? Or that I should add a new file, but write the test in the
same way as sockmap_basic.c implements them?

Thanks! 
