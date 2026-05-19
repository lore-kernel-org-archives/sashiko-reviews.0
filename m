Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6D3AEF59
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174547; cv=none; b=bAJI4zgIWRTBA0I8qS+bZ7apIQg1TMbCurbV357rm2dWKZ6xfaJncgrHNcvVRrim94br1i6g6bS04lLfw77KmHlKEY8EnUsDlW57M2MCsfXVVfwpiHHkN7fl7XslP4AJxW0uOW1codNdtKOAD+2wsEv896lZJbcfwrb9/Zkx7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174547; c=relaxed/simple;
	bh=ImIuCAcIqyqmBNWHBa3iu6wn7MLrAlHo7NfzYiVsx7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3Vjvbe+Aljm6T2BnLZdsNyT0HwfsHjqN0HFNiskQWVbidBeyhMkzQDXkjRAyQkJhl6p9AAdCWbPNVzCLBlQYqASKspu9OWTwKA74sQNAFTOpVBoFi84HeVWDNUkgIlCBXuxJc0LyT3gxc5ap2/v7zlDqnEmjAm+CB6qtWz0xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S07rSsjA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S07rSsjA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso30945365e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174544; x=1779779344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6a2r8a0BWvk68vyPMWjRdbCGVjXTo9hI370AIbfJYM=;
        b=S07rSsjA6l8eTDs5qJ1J46HeNoFBdSVMHxzy/jdERWJX78Za4KEAHaQeSDcpDyAtm0
         vn3qv+vMXEE7nsqqVCHlBUKDoyfqy8tqLUavYRS5RjU76uHv4+n5Sxj5Lomi+KBEtXM1
         zPZDxSw5DzoJfQZl4qGmWAwrx0Hh4LHpU8GC8fzQ8sImZ2Yp/40CYqGTXdgvfenUJRzY
         rGNTwHzLzHe8B+3GF8kZlg8E4K/le5oaD5on24rGsh/kImemV4eOQ/FGjvaiBSz3uJUo
         KFWDgVrBrljXQqzG2QcrI31OJIEgGymHpTOtouArYbOg6cea3nBW2oIRcHxSpWBa4Qkl
         /FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174544; x=1779779344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6a2r8a0BWvk68vyPMWjRdbCGVjXTo9hI370AIbfJYM=;
        b=SmPgPQLAI+33ZEsXrTjXgQnphjHwFcE9xFpmsBbhUXuMw3e4rLpqkxqKTT5ADdmuh7
         +qSb74VXlp3kbofi+wq9dmtqIIncOH0IUMrGGpIa6wmG9neVPQ07yYmW481j7fJNh+k7
         z3Zo85YxP4qVwSguACcbnPrg7K+P+Vni/yW/iku8Z9EVAEWdegiSAk3ZU0k8TPMmatOD
         VRJDxIAyLQ8HhyMYrFwB6sgNq/jKXUbdksaFQVLQys0aeH256RYXv5LdYov15h6p6b25
         x3SUHELsJfU3K8m3s3IzDPT4YliTByH0lLburOt+k+1w3kC+P21gny39TW8NEXPkcOw8
         xAeQ==
X-Gm-Message-State: AOJu0YyH20NExGwIOjOtRFrUIrCA31yAGhxRhIchpwlVSYE/NpWIj1y9
	OLNP5V0z/60i7iX0EIVRXvVipnLgfGyZIoBbDTl4CbBnUw9CiyJ5ZvY1kxv/7g==
X-Gm-Gg: Acq92OHZ+XSFKUwNNYfGAKOnL2eFu566k672HxEYE3PKNgs0vk+n1MG4eNHv3lJw8n4
	tvka8IyoPvcVUqwDvZe+L7fG7kUA/6P04Edr0aBAPt6TsF4E6Rtpo+rofZMtpiwM8cpGpaSe3xG
	zK7qv2MsyQLQpQGuwyaXvhGqkvCd6sXSQrSYpNJuHYXpbfjxvGgYfl8SeqQIfnZKxs1NS0ynVkS
	r/I/wYXhyOPeNbDpTgexZy+R3i/7r7FpgTxKE4q84vBZeJ9j8j5TA5zV8e63zW7bpqSkZl93BPu
	CQBW7HKUjJv8BwX7xjur3CRwjo3ohVhTIoe+MlhIPp+kvdw3zYeRMNaK7FaWelxwHoXGirxP3x1
	tjOht3oeAJGgH+WRZgmiY46avdS//bEoA7S5ubYFaL2eGk7orAh8G4TMaCqt7LxAnSTjn1I/7zy
	9lyo0y51doqoxm8zOUhH8UekQh8ogQLTZcfw==
X-Received: by 2002:a05:600c:3487:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-49017d45a80mr77427095e9.4.1779174544309;
        Tue, 19 May 2026 00:09:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe83ba2sm98359475e9.35.2026.05.19.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:09:03 -0700 (PDT)
Date: Tue, 19 May 2026 10:09:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Message-ID: <agwMjD3sjAaSMIuw@stanley.mountain>
References: <agv_jhP-2CNTfQXk@stanley.mountain>
 <20260519064057.31E09C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519064057.31E09C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 06:40:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [Critical] Unlocking `dev_ctx->fops_lock` after `dev_ctx` has been freed in `se_if_fops_close`.

That's true.  There is a use after free in se_if_fops_close().  Someone
else care to fix this?

> - [Critical] Invalid `kfree()` of an error pointer initialized from `memdup_user()` causes a kernel panic.

The way I remember it, I'm the person who said that __cleanup code
needs to handle error pointers and so for as I can see it still does.

> - [Critical] Direct dereference of a user-space pointer without `copy_from_user()` in `se_chk_tx_msg_hdr()`.

Heh.  Sashiko is smoking crack.

> - [High] Concurrent modifications to the global shared list `priv->dev_ctx_list` leading to memory corruption.
> - [High] Concurrent access to shared `cmd_receiver_clbk_hdl` state in `se_ioctl` causes a memory leak and state corruption.
> - [High] The `.release` file operation uses an interruptible mutex lock, permanently leaking resources if interrupted.
> --

regards,
dan carpenter

