Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940926;
	b=Ehe1aUzpoheCbJmJiru++ayRjikfccDdY6giyr9GU5L4QYRdqzvtLy58GIS9t51w2pLJ
	 Yc/yJZv9YzvHmyo4OV1ljXkl3v7ujlBK+rPM2ANq+byyrqupD9T9+bO6OyYn36tea+Ggs
	 mXdmBTYU5/xZUqXFT8nhbwjP8YePvAT01GCWu17clpnfAbhDhNVXV38qqoX25qFzPvuBh
	 SiHnzw9w3S9yORQbKnILHeA0optFMhDFbOmbEKkoeULJeKPd0M0ChA3I/nyklIa2hPy3y
	 yqtVJbHizxS6n/FL2mCh1whArS1EiZlHglPvQOZmft1LmWMMz0Y5ouvIRZKWQwRfS2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=q383RHQxLs3tFcWE/jVO1EkOF743huGapYVe6AV5mN8=;
	b=ebaTlYHRrY3YqkwnXmsZa8zWrQy76iTVSe8QVeyCt5TxDhBwvTt5cvHS0bQMirb8RvUq
	 GPLSPSGEAjZZ2IxA47trcqp1CsA9qoiRA45DKilPixCye3yeBjAikmnGsDpN3fDCGmAev
	 vRcSRtxJU00Nsq27966S2A+J6ANveliiLOpk+pex11t6+UCCCyEcbS1E7VTQxtSt/TAAV
	 42+1HIhKY2e8PK10nau6oN9vxbU5R1uNtOdFPiFG8gL5gQHkRohDTlN9pGbqp6Kp+ZTWC
	 3ySx/K7wapXvqfaDzde5XDw2+yydAqbCnGwpqIuTSTi0Vhwm9PPgs0FyZCnEyUrdlaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TtOX6XgA;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3B606A338
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 18:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF3B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TtOX6XgA
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so226947c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794940924; x=1795545724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q383RHQxLs3tFcWE/jVO1EkOF743huGapYVe6AV5mN8=;
        b=TtOX6XgAkqbKlTt6cWyInrDbkOkKuZwZKgOTf2+c7r5WCtoIjrodxsbwOSwjwusB1H
         gYl408agCuZGsHpOEPIqWJil5Omvtl9Dz/05lRZrIkr6BZ/sNl37ckTZcE6BvYFVWFwg
         S8qNkGE0MQvPspzj9HDTwat9pzLIU80YmsRF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940924; x=1795545724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q383RHQxLs3tFcWE/jVO1EkOF743huGapYVe6AV5mN8=;
        b=doVbb1TymQWXjAOuuUJ3HvkIjW4yJXQPtgaCRTzOwksGL63bhzs0f62gFRYY+8EpQl
         DvDxQAGV30bSU6XwDQojuakK50Gp1pXYkEWVl88+3G08p8ruenahg0veyMlMytPZEtp6
         DaVTdId5PqIQfPvwS9GLigkLvqH+9/ektviwGhxkYROKwOHAL71V6I4ErKlwBBMX+JnI
         L7+V1lE8MN8LFdy7bP33cBhcZJdzlxa8b0rBuMlzLULqENMaxAzQkGqgU9Tng3wokULV
         Fqn+W8KFhtJurUQtI/v0d9ySKoaghagsl3Gh7P7OyPDqQIOBflx2AlZXCCh5wuwtIAA+
         OGAg==
X-Gm-Message-State: APuU4Z/55vzpTgA68uapcZbFn+i1BNaOZjLTlKwVHu92doxZqLOGpDdD
	+MTIvNCU1CGr064dV0vVRlrBtw9qMYpZROZ4sknRZNls2TOc853NDBJG7uZcQkQQaBeBvnsDMZV
	XhaE=
X-Gm-Gg: AYBFou3YVkmLVWEIiVCdNjrj7UBPid9Gdg9TnjvSD6sQIcDB2xWaU3QeFPRAXarbIqg
	hE/eF/UbpjEbDKSOtXUp5Dn5935SB7TYr/Z1S1/0BMYchu8NROWDueJ1VnxqW9lfRRG08cPhuNN
	ZfE7cpQX1my75TyPKRgREewvkg7gF2+PJlTotpUa9snp04AmuvsKU84jrK715ptwIpX617MqgGd
	xrLH+7yqvfhJ2/YZjDtI/zSZjfRPC/p+aUnAgn8vmBjeeslZtW/YIU2QnprTVWnui0a9IjVkipE
	Q/KKNucJLaspLGUaejU1pPdD9YmpdN0RPJDzo/P6AxFMkgCWqpJAirCTlP9jwzbnEDpZxMLvFep
	rFRlRKt6K7UEaztqRkftJTl1r0rPO+cLHKV2QjBrTIBiPClRoWnPjLJ9MrPIlTbutFZYZzJq2Ub
	ik2nVzm80ym8kA72Qt8vtiKDGO6o1GeZO+TIQ3ATFzmaN6I1nSD6J1szrD91PS91B6dImNhMLu3
	R3fXJFyzmpC8q9iQXhv/d4mjt1ZtUfuhRVdQcLmIFgtwjQddwz8mGv5r7M9l91u4iHK3hfJBS4f
	g8ssRU8d/x9CmhtJGYV9PR16OadL+gR0F1L3Op1ii9Qc0ddowbRLcuT1ynFoMRzH5nSK
X-Received: by 2002:a05:701a:cca2:20b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b543d29a65mr399616c88.19.1794940923953;
        Tue, 17 Nov 2026 10:42:03 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5446f954dsm131078c88.2.2026.11.17.10.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 10:42:03 -0800 (PST)
Date: Tue, 17 Nov 2026 10:42:01 -0800
From: Brian Norris <briannorris@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <avyf-arwNO74QFip@google.com>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
 <sashiko-outbox-217828@kernel.org>
 <20261117085552.0e4ef272@gandalf.local.home>
 <avybp3O2zxcLozKB@google.com>
 <sashiko-outbox-219362@kernel.org>
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
In-Reply-To: <sashiko-outbox-219362@kernel.org>

On Tue, Nov 17, 2026 at 06:36:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] tracing: missing Signed-off-by trailer and unformatted email
>   reply changelog
> - [Low] tracing: ENABLE_DEFAULT_TRACERS stays unselected for direct
>   TRACING selectors
> --
> > Anyway, my point is that it's not exactly straightforward to enable the
> > features you want and get the tests you want.
> >
> > I've appended a diff that seems a bit more user-friendly to me. It
> > makes it more explicit in the menu how event-tracing is forced-on by
> > many other tracers, but is user-configurable when it's not forced. I can
> > formally submit it (in 2 patches) if you'd like.

Well clearly sashiko still points out issues here. But I still maintain
that the config menu here is confusing and hard to use. I'll see if I
can come up with a better solution, or else just accept the
un-friendliness.

Brian
