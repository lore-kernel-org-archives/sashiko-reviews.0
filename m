Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953184;
	b=Y8O/k+MC2acxbFAAJuolLPeRVqLLI+/t/sKt3KEB4qtXdHqbgigVqUvjfH5Cmd/2hmDX
	 Lx7y+CVrgzPlymbIhxeAgyWS7rnFt++pPQ69L4F6n4K4DQ98GCYEV7gfxv/aIcwTav1Vz
	 JZfmIvQaVxPk5UR92b3qRSoRPCWdfxL6Dw6J4ulrz0z6d/qg2sERVf1aOKHitLcmw2MJy
	 /kLMVZYcTeJD+pwgJmsgG3aHwpr6KHgDQaPwQrG+CsOkTnWHH9atHUS1Xaa0r31hnAjI5
	 N+zOp+wzcYdwzWp2nyiR7ofoPnyX1q+p6u+L9wg5XtveC94FQq5YwrBter8pIVABhbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4QCrSOE103jAJ7lFK0yzz1YlOGkg9iIEGGzfD/JSyU8=;
	b=d1Fgh8kcrHHn5Rny6KOqUIP4vd0sBL8/RGDjJoBL9MumrG6Yk11ifhTnXLiR324Pm1pT
	 zvKMHRMVFPIOymAVzlPN7ufQYblJI1cgszuwI6Ryu8XEQL+0uRKxj8l4AQiIiwX/BgKn3
	 lnNfbc2CTkZA0+fW6fprsx8L4Wy7jWwRXkPWfJXxJnh4kg9MrKauhJwYEKifABmDfNT4d
	 vOiFeDW04mQjptwAq6H8TtiAK4HeHPi6C1c7Awb+JfCA8c9udU44ONJ5AItiGmY9KuHIM
	 VmpsznUbBG2T71u7qQ5rAkjbPFSgiFR7dgwCPLBw8tt3bEl8iYU4+PgpvrwkpqF3DSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzkAzAiw;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988B606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 22:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6988B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzkAzAiw
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso104744f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953183; x=1795557983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QCrSOE103jAJ7lFK0yzz1YlOGkg9iIEGGzfD/JSyU8=;
        b=QzkAzAiwjloh1KrxKQmVH7PahpZb/UbI0cOK0TZMiwS7neINLT/D7UV2TeLjsA9WzU
         ZTmOUKR+25WySBweZBHkzbSNtsk4tIAXOBYVAcBw0+XwNUYDXJXy5hJ+iOyeTbYfrWeB
         90FlR3cEB24mwkU30eZq++iqpSb84JUbp/7jNeSJ8EKaCMs8SeKjgbKs7GQJM37zrt5y
         CQZrGY1msHQVoeHuWHr6nW2I3htfgCiuqMa3+aoKJFUz5o9CI8JBpI0Xmo/XsDWEjAyh
         xppg5ZI1jIzvADgR0d3ECYjw4aAXQU38JC6wBB6pLcrwmGnvd1YUnkokAshJrRqCezia
         5ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953183; x=1795557983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QCrSOE103jAJ7lFK0yzz1YlOGkg9iIEGGzfD/JSyU8=;
        b=MoTGZvC0SSKYYPEZNkGV8Z+OZVaHGHuf7ez+sZQ9SyV/aaEt5MREDli82EMMQkuWvq
         TC2F/d+zafFlotcBbvMWMVx/4632Mqvxqqb7S+bHlC+mxVS5x1c0lQ2ww18zFkantlSF
         CXuqy9ija21z5AzmZNIBuUNghKSCk8eLPOCwpgA5Pvolqm1rleWvKMt8mp3/IY+D5eXi
         7CC8H6Jd8SLnmp4FG4IE5akc3h/GDP7TOxwJ2x2IUedvp1EOxncGMjqL3rL6U1r47g+i
         ACBzkHD92AqUxxk1ibXE8UGH4hiFAckytsRuP8+1k37BwJqwYENtmigVooiNm500w56M
         tQYg==
X-Gm-Message-State: APuU4Z+1GVXiMWM3ZWWn+MGPFrhMh/Usa9LLIjNWkh599ZfZbP1je18I
	766XEqNSeoJhzc8AHvS8N7HgyuLbpCmHWiZUfuZ4K7ehJCnENoCcXkFRhNZxepBf4Po=
X-Gm-Gg: AZFdTZfqGTpaswowhPuGXKAkfj8NTj0G7ayDHgnegVYFVaAdU5l8vB0TzQ4N8gbEW1H
	XPJqRxbeluIBUNzjgEw0o0UI1qfrcs5ecoarvC5ZJzGFzOlHbUDthmF5mjyfcNPNkEgQHeRlItF
	e2pF959V2rSNax8gv0RO31+/aObk9q2xJg81P4WrUDlZqgtzJIzRGit1MNlCToGq1i1jZ1sDgh+
	B3eiEqQxyyPOnldsKOyNMV7DHU6Gt3pR/tqvw/w3pMv4bHxKcpdqgFNN+awGYIIcmy2lyGEJlGy
	8oZNLwKXLfJQrdr/uBzAel9A2XrcGo+jQEJPx1v8JO83mhv06f4zPBgg/T0b3chcYx1jBn80L6N
	NIr+5dLVAMgG8pXgjCBqegvxBQ/GQ4bzswPpCibpsKTIvAYT+BlIeO/fLGwwYXJETcQ8oBizMJa
	5eQrFLCDGeCUQCLa3RVuZH6qgQ19R3h3MidK+LkT2/xRnxSQun1dyjKTKRFD7CdqZugaxvyusNB
	YGjhV7lQnUxjSH7TJDUwNjYbTTbAKPz55kpAKlpBLBdSQZvbLETcCI88hlzMdP7Luq0OgWrx/HF
	FdtAhTzYKv9cYEhaHmtb4/rqLpa8VXTBB4mNJGifTzKIOO6aSYnSvjOov/EuaR/OotnVUznrRpf
	WaWzM2OeZU17jQ3ErZfxn1PgjS/rQp0k/+bk1lXkjaR4BSKIV3lIAqYPN3HB8o8gNspBw
X-Received: by 2002:a05:6000:470b:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-4a63dd591a7mr1563173f8f.46.1794953182700;
        Tue, 17 Nov 2026 14:06:22 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm1091018f8f.34.2026.11.17.14.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:06:22 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Tue, 17 Nov 2026 22:06:20 +0000
Message-ID: <20261117220620.3834899-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219714@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-4-orgads@gmail.com> <sashiko-outbox-219714@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>   Fixes: 7f481716bc90 ("MIPS: OCTEON: Use device tree to probe for flash chips.")

Right, that commit made the init a per-device probe around the one
static map. v5 adds the tag.
