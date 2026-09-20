Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636A438470
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912165; cv=pass; b=hgCE726PL4GGUXso7dZMDvca0uZHFqW/rzij9xqHuTw7t5J5Amozjt8xvM2kkKXrSaFTr6Fazyg437aWIXItVA+mU/zgsdrvMNa5vXWXI/sd5nA1vEVCbXgXZ+GS3jt+iZUmI0f8Omv7XVtm5DU7kvYMLMOTsNldfR+H3k2L4Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912165; c=relaxed/simple;
	bh=s3lTFp6lURx7MrRYn18AT3Pe7UpgcN21QfCy8Gku6t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYpaAe27OHfaEBuMVdWI7/2+9wrk7EboYBitmDg+rHIuP4lSKzwYB2FvSWoRMHvssaBCB6Ql5it8Es2NQxyazmQZ0YhZYgN6M6D7/lXEtrpitEJWvRmp3RXHzzdfsfOi7d9/8CJkTxJ5C80JsB0tYiWM+qMUeSOTu77ouA11xVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=6QgUFINh; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="6QgUFINh"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1929062d50.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 06:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789912162; cv=none;
        d=google.com; s=arc-20260327;
        b=qfnEMJa7pGOrtnFV2HgJg0VLYTB5RMG+L0S5y38rBhgS/SVOOPHD3dlxuAxZJ9tX0b
         NWJ6yomOTl/NHQa+0SHMmHgPtmxvpsgHgMQVKj253cI14Ut7WpKP2ak4RCt96wGER4v8
         w9jM2Et38q1GSeg3KiibYqfibYWzFBCQeqyU+/nzULR3YFOa60W6UvuqDuJcs18McIMf
         vVXcb1mOCvoYXFZuLWcWN8nZ7X9yhbQBy12xcmbLsT0SEZrgHJV/3MfDHv70SZa3TKNo
         94Zuhi3r2Q6Kx2zEsthEMrjS7Cw1WKU6dCIlwbb5BNTa4kNysfRLlZhik865K7Tohxsf
         eKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3lTFp6lURx7MrRYn18AT3Pe7UpgcN21QfCy8Gku6t4=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=j5qF4Ii8z2t7sCHMXLBQeGx94BM56XpL2Or+lyQ4bKPK5TCPpC4myq4UmnRcU75ath
         knruS6cRGCC3QgZKK2AuYU5Q4FCfaeEmIuN3k3iC8wS20fhHLORrF/KpUz0adi/shCpK
         YiMdVQYxkmr0gap8waiFP48tflfagfIs5bbFWLRFwxX62kM6JhY1veRH9+4C9HqttLFn
         TJ32sELGCv/lU3fo0anvEU1nnxUHYW42RjJ8s+/iAtbGqOrCpsuS7a1vithjWhaFEnJJ
         aGkOJURHL7I1oiBIGSJx2qiUb4uhcJCKaKzXQZn/O8QwfnSSi7ijq5qLD5EcciH9bh1T
         5ERg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789912162; x=1790516962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3lTFp6lURx7MrRYn18AT3Pe7UpgcN21QfCy8Gku6t4=;
        b=6QgUFINhoUuP7U6HApNGG/fiBVlZwTkB8eZeoS+F28iKuJLSoHovHOIwXTxmfukqoK
         8zLisgnLHq9K05zH8FNOk089bu5GHHT3lV8mG+g/NIo0UgPMVDmpxJo9Va9Vq00adeOC
         5IisbR8mpGu4BrpM8ay08H7+xt+y+4odsWDWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912162; x=1790516962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3lTFp6lURx7MrRYn18AT3Pe7UpgcN21QfCy8Gku6t4=;
        b=jZQw/nP0/USUL3t2XkalWBvK6688iR7MY2znDJJI28JLEp4shKMT9KoVLh4T/uj/rK
         tWIO4SO3HHDWKUzY/8Yz423bvF+dJKrnpKeFp1GlJnxD45fv/XUvj0dDHVGlhrEoUPNM
         ELLGCpX6LhJSAjXWZiYd5Tu27pnw8xhKAmdQFTFBE3+oBKDx7p0fXXpPrvpyQlzcYXdg
         +LJ3cSFwV5mDOmMCA3NhUQwDvGlLBts6YBn9ltMSm5LZdPjq/RP5BIi5eW394X4L88G7
         MqRxcHQ2MAJACMWwt2cJZYdWkmhAK82SdRXLTMeD43C1vdA1njWY2VnpO/XvSGk01TAM
         eTGA==
X-Gm-Message-State: AFuF++l3SXQQZcrqcJfwF+R4eUcH7I82ZmoqJE9xYACiDy6EaI7GM16r
	UxSukJURoC0eYNkdo6gbmnC6I8CsxpCtZM8V6V7R6uJH+dRApkNi8oKSQTmLXw/0ealLaiu/4Z4
	/qHYUy4u5ijykGQSPI0FqAluikl5S02Hi2BmknZxbrzaTIQJrxjwO6zOHXw==
X-Gm-Gg: AYBFou0n+hX8UBxLg2YpO7X1LJAlrx+IJXKnIDvNoIO7aX6sFV/B2DZ3bqI8erjuPRC
	Y+/M1pedvtn/LoMWAP74NlLi8W3yvqv5pX+BTDGXafAWnCeANQWTmxKDJaQ0ByYii74qQ2ZV5oL
	shAB7XHs8j1AZrpSbD6YIPRWdhAtIJH6Cr4jq0Mug4WCRO7Bv0RktaKoUuvCCZ2QVrY/fhrYNW6
	v+zxYWXeOT8Bea3XSad2h+ezlC6AEaocYGuAxthtOj7LRL3j5J+i9vdaSHfpGLj1Gtt72XqDNHf
	7HEOTaXFkUb1cKgYOufBwBWbCcYoM6gWe0oixWPvnXoe7xrs4ecfQqQWoFdoAjs3tZvfxcgF7Re
	58HxTsqlQZ2xO
X-Received: by 2002:a05:690e:4393:b0:672:99e1:11f8 with SMTP id
 956f58d0204a3-67299e1175emr912062d50.149.1789912161654; Sun, 20 Sep 2026
 06:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260919-perf-symbol-memory-send-v2-0-495b8f00ad7c@uber.com>
 <20260919-perf-symbol-memory-send-v2-3-495b8f00ad7c@uber.com> <20260920024557.B51D81F000FF@smtp.kernel.org>
In-Reply-To: <20260920024557.B51D81F000FF@smtp.kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sun, 20 Sep 2026 06:49:05 -0700
X-Gm-Features: AcwNN1WGKpnrwDy-gIU_CCYFGPc2CgcA7grptGAj7xrJsG06HBe7wQg-Gy4arJc
Message-ID: <CA+w=M=Qu-R22O3J1_g9HO-f6dv4Uey_vLZZJgNsH8mK53k2K5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] perf script: Add --lazy-load-symbols for lazy
 symbol loading
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> [Severity: High]
> Can this zfree() lead to a use-after-free during concurrent lookups?
>
> If dso__materialize_symbols_ondemand() returns early due to max-symbol-by=
tes
> budget limits during a concurrent lookup by name in map__find_symbol_by_n=
ame_idx(),
> the dso__ondemand pointer is left non-NULL. The thread then calls dso__so=
rt_by_name(),
> constructing the dso->symbol_names array, and begins a lockless binary se=
arch on it.
>
> Concurrently, a lookup by address in another thread evaluates dso__ondema=
nd,
> takes the lock, calls dso__find_symbol_ondemand(), and successfully mater=
ializes
> a different symbol. This triggers dso__reset_symbol_names(), which immedi=
ately frees
> dso->symbol_names via zfree() while the first thread is actively reading =
it.
>

This is a valid bug. The budget-truncated path can leave the lazy
index active while a later address lookup invalidates symbol_names
during a lockless name lookup.
I=E2=80=99ll synchronize name lookup with lazy materialization and add cove=
rage in v3.

>
> [Severity: Medium]
> Does this missing release barrier risk exposing partially written rbtree =
nodes?
>
> A thread evaluating dso__ondemand locklessly in map__find_symbol() could
> read the state as NULL, bypassing the dso__lock acquisition, and proceed =
to
> traverse the rbtree. Another thread executing dso__free_ondemand() stores=
 NULL
> into dso->ondemand as a plain write.
>
> Without smp_store_release() on the writer and smp_load_acquire() on the
> reader, a weakly-ordered CPU can reorder the reader's loads such that it
> reads the rbtree nodes before ondemand is loaded, observing stale memory.
>

I agree. The lockless `dso__ondemand()` test does not provide a
happens-before relation for lazy rbtree updates.
I=E2=80=99ll remove this split synchronization path and make lazy-state
transitions and symbol lookup use the DSO lock consistently in v3.

>
> [Severity: Medium]
> This is the lockless read mentioned above. Is an smp_load_acquire() neede=
d
> here to pair with a release barrier in dso__free_ondemand()?
>

I agree. above solution would fix it.

>
> [Severity: High]
> This is the call to dso__reset_symbol_names() that triggers the use-after=
-free
> if a concurrent thread is searching the array locklessly in
> map__find_symbol_by_name_idx().
>

I agree. This is on invalidation side of the same race. I=E2=80=99ll
synchronize `symbol_names` invalidation with name lookup and lazy
materialization in v3.
