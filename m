Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815150;
	b=oqsElLCssIYkMvIGWQzJgYJclsCoX7QdBetsvpPKw8zccMmviDgsGsGscmYgeE1F9W7+
	 lKK0M9cVSSqocaMwQ7YJZxwAGi0L0KO5toT6XO1RgR/jKfkTdLEnb4W4EwwkPVGZV6MRI
	 RZyulaMGXiTYyinUdv0N52Cdc0+sklSwXM/eslU/Cm50vCkmeJypEGDKTmVLpXxbMYwiW
	 /XOabNiKIGggsCyRYsLeYWhXLAeCWaoTTm8e1s8moUtmu5wL8JbJN26XQb3MqwBMEE8HT
	 49oOizzmo9TT4rtYaZnV+qaO6xjUbqJo2Ga5/+EzGjyYemETHqq1Pp2TUojtMt/tjhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
	b=Ga8YvUucyBMI3tSpsFTy4iPsLAjOAkPeFa/F9X/SbxfQml890DoqStdzt3YXHEPB4wY5
	 j9YgMr6oxgmtSYF5HBM3n3r8XxOqxrXIVt3da4q4dfg21DT1V5GQA3Yqhwz+IkT/lVgYV
	 eUrmXRJejuQHGUdeVFXtWXmigS+fde3mK7cwp4pfYK+jtx0Uwfsv8waQ9gq6280EWpHqy
	 tnopogfBU2tiF7/Lg2jzRpFzfumyMEFXZqH8UlZeieDGIU7FZbDqnPzBVHb+eET34td78
	 7sYg3934C9qFI3ADf5wAb77QusB1hTfvF3K5wVAOn1sTHD2n7x7Ue/s+QjwMPR+dBWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QvY090fS;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D83606A8A7
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D83606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QvY090fS
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so728777a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815150; x=1795419950; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
        b=QvY090fS04hH8XGK2B6JeDUcR4xA6JvL+haBA0olJViI7wAzkYycHlEMjIZ9aupEey
         LnfwPaFVhMevAVJaFVKqJAX2PY7jeFkAqxNFM97ncn43/jp3823n995SR6n0Azfe3lry
         w9LjTbO0pzaU22TSahXrTix7LjKQH3kyzDuitSPltDcXSLJpFXkSG4Ec75qyHcXtRkkm
         OAv5CiY/rsIwnvbl4maO1MQBw2rY5nXYaUSnzh27ZyXYcgGqHpSgCnztr4bMHZPY58tE
         a1A9Q0APf40Pjs6GADVVRFL7Qx0N2z/XcXz77GxBAFu7yT5QNOauAqrh853pxR5aC0sl
         FRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815150; x=1795419950;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmgK2rZQB0Zps7NPdGicEsUeC+FDAzmra5NHyyX5KYA=;
        b=ux0EOtjltCarZ9X93zznCzMWggJ4CwrnXIpLXyA47W5JX2YHKx3n9VMNNzBIeeGG/D
         rxbr+kheSkefDDIf9o2FNnHuv+7inXTCOx71P5WkIbSt5yc+XkDxkz4vXsXnRgyK9sgE
         PR62Atj0BEfSckr1JVB49N1d7/iuwdcj0oREckw/b59ZtNelmTqcSaahBUtFijgNQldW
         Mmsp5+4Pex88LqQG8LCyd7n9mgVNptaACi7H+CKZFph8D19+r3lpqhyJfN+kjc/SwvZj
         z2gpOitwtkwL7BWzqpyFgBMvZa63uCrmWjBOYkPKSdrR21jjCvtLTh5nHCD92GZqEHRe
         CGww==
X-Forwarded-Encrypted: i=1; AL+hErFMNb9GeLWdW9Al0q8gdYYBwDxeElOBx6AQWoLxarhlMyL+jH7vhTwEj2iRbpdaWVx4S8812x5IBskz+PhqkS8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/xzLGSA4HPtB8HDBigQgfLJ4RG06R26ElWZa1U+lO/cOfH4ciH
	nBoEgZYzvDS6oftznYg85ex31ewO92yQxZJQcRnlD1CxEmZw31EPTIgk
X-Gm-Gg: AYBFou23g8DPcWmKT5awEDUstgidr1xwHwfsAtP8BG+n446FjvDSDG1oWF+I8X6TUmF
	X1KqdmcAFZMzHovzbkVoLNpsRmGM+2r4/qh0BnNo80+MeIcboeC3Vof/wDg945VBwfAF8K+U/kW
	okdZjGObuyebXWhRgMkUSlztDBPRseASiVbfIPr8QtT2V3wlcrYhMGK0Nh1OPTS4MyZoBUZQhS5
	etoVYGGbS8O6C2dYMN62+vCp/qIxJIZl6PKWQ5URfP2PZxX+uGwWOE9LWd8paM4JmokIakSEcj4
	x9Hc1HJprvxEpkpN6eUHBYv0e7zlLxFPyueaxVvAg62J6CdAbG3v/d1FGz5KKKXssbFTEVP93mE
	ne2RxhNk6rGF1b/nfneqpII5B2Bj5yRT7kWp9DR7hh6O9u75I+CJF/yQZ+AF6b+b71bhHydOLpu
	Bi3+RFi+ii+XYQgfCsfFu2lnJJRfhkIF1kH3KFnOE2WmHxzTGyyQG128ZkBre4p38FCEWvuuPYH
	J6vNX9Hj+EQrU20AsAvlduhmPOuiT2SCAr/axcen9ixSV6plAlsiT5t+ybUNmhh7cJyWL+DtnUW
	U9I5N2+1d3aUDjAxu4UlT7UgQS+z2KN2rjGuDxDTEnq0jDcGViTS5IvmG83AxMw58F9oNZQrwAa
	sHsncqqa5IGIQm8yCNQLbmIeW6UsfI4lTDKteJXNM42Bj4WeT6bPCKBUZwMw/9oA=
X-Received: by 2002:a05:6a00:181b:b0:8a0:7677:c8c9 with SMTP id d2e1a72fcca58-8beb7c21179mr8733834b3a.51.1794815149534;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6dbd9sm3244287b3a.27.2026.11.15.23.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:45:48 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 14/27] mm/damon/paddr: support REPORT_MADE type
 probe filter
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 16 Nov 2026 18:43:36 +1100
Message-Id: <179481501691.2405628.8067144236288202449.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261115202849.99134-15-sj@kernel.org>
References: <20261115202849.99134-1-sj@kernel.org>
 <20261115202849.99134-15-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sun, 15 Nov 2026 12:28:32 -0800 SJ Park wrote:

> +	case DAMON_FILTER_TYPE_REPORT_MADE:
> +		addr_range.start = pa;
> +		addr_range.end = pa + 1;
> +		matched = damon_report_exist(filter->report_type, &addr_range,
> +				jiffies -
> +				usecs_to_jiffies(ctx->attrs.sample_interval));

Since the window is counted in jiffies and rounded up, how many samples
see a given report depends on HZ.  With the default 5 ms sampling
interval, the window is 2 jiffies at HZ=250, i.e. 8 to 12 ms, so a
report is usually seen by two consecutive samples.  At HZ=1000 the
window is 5 jiffies, but kdamond_usleep() sleeps via
schedule_timeout_idle() there, and samples end up about 6 ms apart, so
a report made right after a sample can fall out of the window before
the next one.

With the queue indexing fixed, user reports submitted every 50 or
250 ms and covering the whole physical address range were counted
about 2.0 times each on an x86_64 guest at HZ=250, and about 0.84
times at HZ=1000.

Is this approximation intended?  If each report is meant to be counted
once, maybe we could keep a per-context report sequence cursor and
check only the reports enqueued since the previous probe run.  A quick
local hack of that counted each report once on both HZ values.  If
reports are rather meant to stay valid for a while, like a user saying
a range is hot, a validity period separate from the sampling interval
might fit better.

Thanks,
Aveline Noir
