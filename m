Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916990;
	b=c3po3QdYkWCWs3B2XRP1iOnuFL+xXzN4LnSmYvuJaVgS6nz4I50Sv6+YN2PggYJ9hHQp
	 Y+sH9Yv5bHmRWTvs/CZDOMP+vloIjo9sIWZcw0W4FA2pw1JB2TmGJpeM+iExH92tw9zPY
	 Zh7CnCQiS4wyc0xsOJchcV3uRRNeqPc6MlhbhvqPzu2sHzYNyYwSRU/0j2Og2xkRvpc7m
	 puEYIBvhek+iZbaomQTGYLredDtc34H/aeEZ0VeNl3iujNk90zE/q69eGSJwcafgCeKz+
	 HyKmhKCfuWgFV6LiylGox+2uNKFz96s306NftfH2SV0vPu+qc+fl92a2DVx5UVsTheQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
	b=kNrC/H9IjBfRw1p/szbYnVj2WDbC4ZqFLvVyUlT9NIq/9p6oLNAKNQIg+bzzEoiRRF46
	 f5AgugB7y5hxpeNon4xTcfDMNFf/FhL/RdPkpvePkSs1jAJNSxQ5exQ4n/xNnhf5PEH5t
	 3lJpTaKABej5GzR+BBI9gF2A+kzDV79mal54v7BF4iZq7AHpz2fis4PvP9gT4TLfEHhsQ
	 GEgGu4NgmoMxXLNbyefkkF0Aqe/MKsm3oRWKnjnRX9pQMh452hCau6HtA9coUDfKY5Al7
	 F5bGONbWpMAo8t6gA0kYxVsNPZ8Ke2NqjPnaOZ93t3NpiEVDADZt0MDIPz/z4z6RDdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cJW1LZZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33F606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB33F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cJW1LZZE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so461938566b.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 04:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916988; cv=none;
        d=google.com; s=arc-20260327;
        b=V968IDbS1wlBCTbmS+He9xX714po5ao11eywYhjISX5ix21fH/DF6w42ESMBX+S59Z
         6k3cz/FKbZUOBLWQoVdILXF5O6nsUOudyJilb09oBRp100gJnSk0+GGpPLov6LS00sPs
         1/GEFpBdVY8DnBP+CeAFNLa75+oC9eXtoOguQkemYI63lj+fDPASBVxMeAkCma1r2XhG
         jzlVOsBroCtq7B5sTOwzjXlpV7rGQiUzb2+C6Z8yh2bgclAAmU5iMNafVogLb69o77SK
         5YKheHKWqryHlgO7gu/2str4+GFYPGiwFlbkblhQnxkvx4ywiivxHv6xb5PX172XZzBu
         Y/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=BMVCiSCJbgHzuq0iHH6Xzk0mI0Qfpouradro9PbWwEL0inI7WvwtGrc2Mk1yrHeSHR
         5jGklqXXIAXE2Dr6AMXF2A9032NcZy+mlX0ddUkG2K5sG+o44IUFLz/FdlKzEnYULMPw
         YBucC9G7TotmQ0lr6tumA+wWF9qbZr3MvoAB/xVo9nWhh7IYJp8YVw2C0x+wsQMh+4eK
         pG4tqMRpUzJeqr9do9tM0mkORzLoiYDqw/tRwKqdaHUUBkoMI8wk4icqHNIjAysOhNTQ
         nyYp3t0O+bll4bqu0tWpUL7zfWs5auAYk6dbd21s1nq0EoTX/9OPQZD3Kd0aw1dKPbMQ
         hSQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794916988; x=1795521788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        b=cJW1LZZEmsJNLZ0Kvlcb2moNsUJjqqBJ6AW7mrE9wLDoaFhKIuc3rN/Upd/v/h9KSc
         qtF0KRU1giRQkCbjYeRjEDg6YfZ5sxhKIWyGLuuPr1T2AvUiJV/GNGdOTpvLI4CxWbtV
         6CLnrwSVOorbdpPckU65WxFJVnifW7p96zswb5P82yGUVTckEZe1cvtWwAs7KOI5rGwM
         dJfTIXjv70iFvBQthAzgYczV6YbGf54Elhl+Qfzd7fLh2OaW8rg3f5RGpOIFVVrPSVgg
         4nBkprC+rdwW90MlO4F0ucjo+WxOmSJ8VQtsuyrPn7HHJ5GtLJyDV7YHPj1K5UE/SLrb
         mzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916988; x=1795521788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1vpqFbxBot+hFBN4I6DOinqXAgCtzkR2JZJJ61mELM=;
        b=tzQDheLVkJpouSMJeJJ0anWFykN2S2TzwIdZ0xnkm3TWKaF3eE9FtftL04P06jurCy
         lEaVSEioNn8JNTEEDCs0s3cyvDWrXbw/PVxETRzcGgt7iWoavnoOUJivUXirMsA7LfMI
         UUNKzbtZGmRXdy7iItzCjjc9/MlhpSzlG6xVEZuoCC+F9HPndB+95ENazxtrfeiXXzCX
         X+Bh/GE+haL0kZDh2/kMRRUl/g2N9me8NI/6CbO3iz8GJdNkrCaEh7Slr/cU8aUzLu+w
         Wn6zviDiQjs7wCLtWzWf0HOZNhiIlxEq3vwFCUiSEH0KTsKLNhW6tO+DE1aTYYqlmYED
         7gHg==
X-Gm-Message-State: APuU4Z9XZyAbOlCk6kxjETiNTfC1YF1NSs7HuUWh9ugmV1P29rLrd2xl
	a7H4QSAqF56pS3Be50Z9Nv6Du9gzfuNUNyjbItwrxmMuotWeKlpA2dyoxKfBozG4WmOFV3YADEm
	MhLaCSo85nqwUszwErJ1wcEQBG/aLtnFPOWN2te0UxQ0Bk+zoFrtW
X-Gm-Gg: AYBFou1wx+ikBh9x2LWnERv4HrLmPG95+lBJ/OeGT9PrN1uuMy9t0GnvBs96RFT6OfQ
	4QQMBTC1kZZz1DPct6mpUlLdASFuJjRiwGQ5utUaaHFyxVEBplJzVG5KUNwDDm2TuvItUfXc9XV
	GyzteewyL75Mj2phGcfPlqmJ32i0BkKK2FlJdRZEdE068oP6rjlEJvYsocQaLWGG57ZJ14QXPVl
	5havTcdLsXhUXA43BUP4oGQlQ3ncYBbNdDcHlFDkyxJOTU/gY9wxLw7OaKra5ItW6iNz3pBLN3Z
	NLXQea8VS2YBwFd9bA6ipNUracNF3E5tbzlLv7E6WSVjGoW4ASmaICexc5Q0Xumqur01iDLQuoi
	QD8wm9KtseN5VQA7Z07kJYszoLBzND2y/ot+r0pGrxahRkweKgRKjrOZ0o6XUnBu7wy8JwA==
X-Received: by 2002:a17:906:d54a:b0:c41:6de7:7dee with SMTP id
 a640c23a62f3a-c509614e905mr1090984866b.7.1794916988054; Tue, 17 Nov 2026
 04:03:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-2-c7e1543828c0@flipper.net> <sashiko-outbox-218715@kernel.org>
In-Reply-To: <sashiko-outbox-218715@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:02:56 +0400
X-Gm-Features: AclHuK8wGtfVQvqEUr0N2YldqpRd6FmVVBygTXEaaEX5dXpjW2si5VkbtUvlkok
Message-ID: <CAKTNdwGBHdoknewF80wVJdOs_oswEJHWF=UbZmZ9r1jU5NHyng@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] usb: typec: tcpm: cable NAK in tcpm_pd_svdm() skips partner
>   discovery
> - [Medium] usb: typec: tcpm: uncancelled VDM in SRC_VDM_IDENTITY_REQUEST
> - [Medium] usb: typec: tcpm: sink message in tcpm_pd_handle_msg()
>   strands port

These all look valid, I'll see how to address them in v2.

Best regards,
Alexey
