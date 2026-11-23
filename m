Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455435;
	b=pFjuT5XHUuqWcw2YdR8ZdwGcdEKsLAf06Jein7oIICel/imaqH1BdBcPXcPvjbLeZfI2
	 7xdPbGzJ1yPMQN5nnBJd4ohdOYx43Le9O/V2uS2AuiAxMi+/8CGNG9/jVGTmyLD1MKEhu
	 b4PcCnb/e2/U1F+WWQADsfybsRzibtDaWNHN863C8SBcr3WsSDGnt3CnjegXogb+gd+45
	 3Ay2zXu9Oqw18OzJI4N/oXJlIe7oeJ4CNmLnhyD0eW+49KNNUYVOCQSI+iJUkQfC6Gb+H
	 uQSN3QcgUvF+pN6L+PvxQn4hZqkXQiO2S+QQcEVcIGp7h4knlGWelTS9r1RUgmhonGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=om/YY5kZeKIylMMbicCgla2f6oKdp4uIwLCHt/pWIM0=;
	b=Ky3mDDfEVj/CMpdcxJtY+LrGjrPR2KnkJWhrz46C4Em1RCeb0hysEMbKvK6dXV68zMuS
	 zz6UAOJBE4Ga2EJDOzAbEfUTQpXsolss63unnop0pCMU5A/a0X4dEwv50MrI4RSOjfAoG
	 K6SxE4Or7a/GscrmL0Q5AgsUgWdoSKYd59vbfmAKIgWVBttIprcynL99mSGAnbHmKTcGU
	 ss1YLqqOhD+AOAd1CT29UY8CxFkkNL58lASTCrV8gPVaZBKEvjnSv5itbvXbnkpAG5p8o
	 gTD9Y/8xwsBrVOLO9eYh/IkNepesn5dI/ja6rRfgwaf6NhXyKJZo0zEQr+emueHfFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3Z+4bFZ;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEC606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 17:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BEC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3Z+4bFZ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3862cc30b3aso838692eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455434; x=1796060234; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=om/YY5kZeKIylMMbicCgla2f6oKdp4uIwLCHt/pWIM0=;
        b=E3Z+4bFZPsgdlH8l6FX8SmpaaIUtA8IIbiwJdY+f1uq19mT8HSG82w4/0zKtKBYbh7
         hdcj16sim9uwcFO44U36vKS8tAOQqrpuBl5tqyDNULWtasSNq84n+/+Km5JGWPnOeQm8
         ApzxF1QI3fCgigPaW0vvEQXlc0BL9K8wf2tiI0UH+ErmUA1fRr10gFZ/IdCylgQuHB0L
         ctDYAqdoi9MICSxPHQJH+IaFxQKt/dgXWUo1DIZarNJ8nr7An8hlnLnAWOmwruPF1u/6
         t2n4rAxtrgdmndbJMUSMUj3/kLPMmONgeATs9mkQx12gy6p5RHJuMVCQEGF6kd2WZz4P
         rePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455434; x=1796060234;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=om/YY5kZeKIylMMbicCgla2f6oKdp4uIwLCHt/pWIM0=;
        b=LOU6JnYOTj28Uj5DwQZxOBNAMBOyPhreBEEx+qrLESIEU5NGioYc1wzWBhbqnZYs4R
         TRcVn/beELjLDOt9S6w2muGZn19lyyzUhVXYEu7tdBHSlXQv014xFV2+aSOQOFE+UxDW
         wwemdVSE5KKKZ8XxmWo3ROp/ug1Ta7roC+Ko4nCIc/jo4XnhFhIPVdS3p/cHuPsnhivj
         JjQxaoB+UdrM9cYvDCNnfD9Aduu93UCs+BrnIb97Xf6cbCyIjA/aJpU2dC0QJF+MVIdd
         cDlAnZpPstM+hn9CMGSmvCPnA0qpHxAWFe0kEw+xr1a/Y5FIhnD3iU4uBKb1WvDaatEh
         ObcA==
X-Forwarded-Encrypted: i=1; AL+hErFifxnBGHJ0UswuR7Z/RTFT1peyqQDZrF1GAEDM/V+M8+NTZ1y4iYa+6mkdw42Fm29bcTRm3PsbKCKF7YBVRUE=@lists.linux.dev
X-Gm-Message-State: APuU4Z90mSBl+HMS+dqWEaujymqOYX9vo7VCSZEMx4sPrqj+fUK1qnfS
	cNjEOwBbG7sgjP3Xtt4yaqgneiq0u4SNrwiLr7JvFWTU+QVfn/Av/4qd
X-Gm-Gg: AZFdTZcBJZbiQ2UJPzWHK/lDm+FnM+jLb4FwbG348oteOrwOxoDoDYi1LhieEhaVJyS
	Agop/kQkCh//6EK/4Pqvk1YrVHObkgs8xsWh95OBXUt4HKLnsTidSIpd0CuqtOczPKRdaCgne+v
	2X1BwXgFe7sFAEoul/E2r8uv/lYfy5Faatej1CGdP+i9xS0buPC3fguOr0hvnfJlkVXE8z/xNdn
	y74pb65YIsC7CWHF/4SGnMnHSvWvp9WDcLNgNcujPdCCatw3SAYmcuipNjuuz/0QGjEJpr60QHU
	QkhWidAbijTyIyqLz3Ftrt87O6qQKPljoiBeXVphciNWWg0QAxwhA3DCz7xTiUDEdgEChYLtXb8
	e7De9UtXyDEnqjXuFIw+qhjZyUkf7AbyYagZqqBXVU9oSIz0wnaezHmnULFKKMvVTsbqgAUinbW
	UaFg9XFbxk98SMbxx8xYcTiJpqUyL4k+UICk8865jKww4GS8pz/lsL0DTdIYZJop9yER+nHPGZS
	46Xy2olfrAeBsUwtaZB7UbfK2UDM5Tzl8xxv5UH7//+jBtSHIQWZ9Z3G7v9dz/Xmd8VjDZvHth6
	OE+Up3YqDmcLVkuWalGyH2g611AteNs9o6pzpeS9pG5MmKqswVgdmyKVRDU79Hp8m3WNZgvfV9r
	V+WDtHr19MyL4vPq8g/9pDVNQm/xAhKhTs09RL1aX7qy+aFLuJztioUBZgpYvVA==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18197276eec.38.1795455433928;
        Mon, 23 Nov 2026 09:37:13 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:37:13 -0800 (PST)
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
Subject: Re: [PATCH 14/27] mm/damon/paddr: support REPORT_MADE type probe
 filter
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 04:00:26 +1100
Message-Id: <179545322647.4.683470932650691650.b4-reply@b4>
To: Lian Wang <lianux.mm@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
 SJ Park <sj@kernel.org>
In-Reply-To: <20261123120009.9120-1-lianux.mm@gmail.com>
References: <sashiko-outbox-227387@kernel.org>
 <20261121211922.131352-1-sj@kernel.org>
 <20261123120009.9120-1-lianux.mm@gmail.com>
X-Mailer: b4 0.16.0

Hi Lian and SJ,

On Mon, 23 Nov 2026 20:00:02 +0800 Lian Wang wrote:

>  		addr_range.start = damon_pa_core_addr(pa, ctx->addr_unit);
> -		addr_range.end = damon_pa_core_addr(pa + 1, ctx->addr_unit);
> +		addr_range.end = addr_range.start + 1;

With this conversion, each paddr context looks up reports in its own
addr_unit. Producers submit to one global queue, so two contexts with
different addr_unit values can interpret the same report as referring
to different physical ranges.

Could we define a common address unit for reports and document it for
addr_start and addr_end?

Thanks,
Aveline Noir
