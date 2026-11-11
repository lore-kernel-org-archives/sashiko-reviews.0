Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411664;
	b=opFwKA3iIiTFvGuy6J9pflifuEveAkn+b2x4Hv+UsDDZJAzeVTLd4mxncpk9GADvjqGo
	 kZ+zmR6czM1i2ZFBl/2ORbwoa5f31IdnqbNhwLfB40Yz0Nz6OmPA+CQuTZzYKq7JaxKye
	 EMvvG15tR9mDDfAqI+z0kr+qrJQh6yJZMJmNNZzhxUQ0fl61a6dIntgC1lCt6TXIFInCN
	 bYEH8YstDULSvdhRGIBo/w2VHbyDbscZuoGbfBNl8VU8rInzaBo9FWDZllF1Xa9GQREtj
	 jIY9S33DPbIUpd0s4Rz6OHKwR/iCUGX/flyArsH/yHTbBFlhpHhH629nL6jmswzwCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
	b=vmYq2rvlDrsdlpd5BTZ/arVIrE4UTmrfHM4eXCQxbfhqO03vvh/4jj7CRgBq3+BAasUU
	 yfoz8a1JUiWVHqNZVs7VU2pmk73TtAscRmk778kXPzMQTrKTMoR8AHTeGRUkehKw51+ZT
	 fHwxs9914n+WAknh71OVmUJdU/Ng2JKHSEKLi95ylAICBgEegr6+yYMWrHMNNWG8DzYnr
	 ur/H8Lzm1IacKh2A9tad4eT9kBNaLXL5Uhismsf2jQ2Ug+qOnwEwTD2NzqymDEKnHuU+G
	 V8VNhx+HUNfI0oKS1lAx2HYRL0+RGnHs1BVDTFUKntmLXVcAEfiVC/7psHIQK73imRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RJlPqjKU;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B0606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397B0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RJlPqjKU
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1850792f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794411662; x=1795016462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
        b=RJlPqjKU4RXHKCXPbAYf0kd35hmZasr+7oa06a7137gbN3HQlqBtJBl0yZRU11HVgn
         DySCWereWLUm7a7RooWHdsoLZ8GyfRu+TBdaY0qUWI1rSV6oMkkZ0AIuoqqI3LPETm4t
         DGGv2LzDQU3hZEEWvSdoE90CENvh3akoqqVVjenDlLkIJD+FMw9+U96uBYIrWPkW/F7q
         ib8ou1DAZ8jNE5rH4WtTuGaGIgmiT9ELOYRTRxFwOqzhKLsfDIdlPcy6ccxaOHlUdr8X
         stBz39DAJ7nyRodSqgTvbWPW+U9Hdtv6c1eYftN/g0Pu5/mT+kykgl8kRnesvcfMy1TR
         lTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411662; x=1795016462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gumcpnox9RWZNFmJ4fGU2nbq4jZfZ90jzjsHQu9+HC8=;
        b=oS0Wco5Mbh8lVlhR7o6HvtmtpNpfyprJak3+syQahraWGCzWWqJNgVQWmxZde5EukD
         bMetEoo7SgDIFqIni9/JSZ3MJBgZrWBBQAcCW61jOIcoXDnA29iNBWdTrswUW5rrKi0I
         xN2lAH/is2f9NfFW3JT1GfBA9jfXw3GRjUOB3tpbL+lBF9OTZCwbJVZX2um+N1ACOu7U
         7L07z4UjHg/PIn7p3UoxMmiBuFK3sGdFKUl1EltKS2uiq6mzkIH48aZnghu+32bEJNqt
         BeQsipXoM86P/JJBiPvFbBpb5U8DTFSMo0g2Spneuj3vhPD21kLDQnTxCVLeQZAtHiYm
         xYJg==
X-Gm-Message-State: APuU4Z/9EvzQycBS8KLxkI/c6CohDq3lLPuzemw9RT0o9JMaYditMf3d
	61GgokSp7gkBbVavW7VAsyv/lJ0TfFkQ+c+94p44F33AxoCd3s8HAML2jAuJ3A7WXdGiBxqV/g0
	vbq3A4VU=
X-Gm-Gg: AYBFou15wzACSpPTyYPQ+ZCIhVfXRoU0DM7m1Q3wUQnjzSsex8aomAlCkbL4vBb35aL
	xl0Qoj/Epstp486pNQbqsfHHWS30So1QZ6g/v9SESROo03dzkBgpdV0b4iej2FI/w1zNOKKsQQc
	YeQykOzEaIgSaLEAzlSLlSKQ5gMdbUu0KgIWke3/AoHDnUkpJkBnGLborZL862FHIGVae9atn35
	y7wmDJEnc4/5fLHrfrx3DVq0M2TvlPxfz/MxodEv1bRl1MdescY2H9PtVjEV2lcFzNVAc0vrJR9
	dqiRG36eeuN1Nm1npTY+IFFpjXIAa7ZhvKDoRL+BhyZBdNNah16l3TMmX1odi1jxI9p5xWSaelp
	NemUcrcUeiFV1WpsZ/yl5X0Tw662ZqLVuFKmDwV5DNgGMxRGtWtW5cKTpzZ6uMZSP43q1yTxA9x
	dnMXw8Xy/2Ut+Ccg6nDerNK4uAbKYi1vMWH4s2UZqS0v9cwlk6MWamEJKgn9eHBwHaqzHXJ8MId
	s2hLrfZ9o7TvfodyhDdkhnta5yJv4fw4nhiGb5AQhQjNKr2S2Jn3e0FV2Cnybr6ciqrZlvb+djo
	iC/G1VV68MTykEZsGK+CoifgzE5gO+U=
X-Received: by 2002:a05:6000:2c06:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-499c5d46d91mr5111990f8f.14.1794411662491;
        Wed, 11 Nov 2026 07:41:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10823768f8f.29.2026.11.11.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:41:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:40:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <avSMiz0n0aXLC65_@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
 <sashiko-outbox-201949@kernel.org>
 <avHm3aYaDdcif-ss@pathway.suse.cz>
 <avHpL7ojyapVvGlY@pathway.suse.cz>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avHpL7ojyapVvGlY@pathway.suse.cz>

On Mon 2026-11-09 16:39:27, Petr Mladek wrote:
> On Mon 2026-11-09 16:29:42, Petr Mladek wrote:
> > On Fri 2026-11-06 17:36:30, sashiko-bot@kernel.org wrote:
> > I would fix this inconsistency by a separate patch:
> 
> Grr, I sent an older version of the patch. I later modified it to
> update the entry only when it was not set before. I wanted to
> send this version:
> 
> >From b4e425390a42bedb5cd19a8bc959b6d1c4a61d49 Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Mon, 9 Nov 2026 16:01:35 +0100
> Subject: [PATCH v2] printk: Update Braille options when preferred more times
> 
> The current behavior is not consistent when the same console driver
> is preferred several times as Braille or non-Braille console.
> 
> In particular, preferred_dev_console is not updated when @brl_options
> are passed. But @brl_options are stored only it is a new entry in
> preferred_consoles[].
> 
> It is even more hairy because preferred_console[] entry is considered
> a Braille entry only when .brl->options are defined.
> 
> Make the behavior consistent and always update pc->brl_options when
> @brl_options are passed and they were not defined yet.
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index e248f2d0d01c..60423c765520 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2665,10 +2665,10 @@ static int add_or_update_preferred_console(unsigned int i,
>  	 * Historically, the preferred options are stored only by the first
>  	 * caller who prefers the particular console.
>  	 */
> -	if (is_new_entry) {
> +	if (is_new_entry)
>  		pc->options = options;
> -		braille_set_options(pc, brl_options);
> -	}
> +	else if (brl_options)
> +		braille_update_options(pc, brl_options);

JFYI, the "else" was wrong. It caused that the braille options
were not stored for new entries. It should be:

	if (is_new_entry)
		pc->options = options;

	if (brl_options)
		braille_update_options(pc, brl_options);

Best Regards,
Petr
