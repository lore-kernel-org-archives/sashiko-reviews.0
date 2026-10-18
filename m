Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A8146D5A
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792283718; cv=none; b=Xs0abpISwgm2hswQKD12iDoLJoJ/twuenSa3P46gw/jg2/lcE7J2nSZTfXceZ5Itctktz2jLp1zfCn3p+gvlczmCSKzSb4kFSHYerYn0Ix9My1+7l9fyoKt0TN+kwhvTrSv55DvjqmEXSLwl9d2fCBfGsBNtzgccwbWlyEicvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792283718; c=relaxed/simple;
	bh=hfjTc2+7mRLA4lbE+4kOi9bthGB0Crc//S5N1v+8APY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=QbN7AflEqbfE1sBSskapwjSCWwIUHpueXjbZCDcGCu7MHkkEbuLu5houSLd6lh1BI1S8AIT27+3jrk3OALeYQQiax2Qg5NGEy/j6+2fap6jIS4EdRFKUAl7R33f8ru9kpTDiefxIVWppb2Vm89RGoJ23PdRGh0DN+C05qPNCjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmTaHwRB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmTaHwRB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso4658225ad.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792283717; x=1792888517; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EH0gDvSzc6w/u1uhbFkTvLvSWpp8Ypw96bljv6WuNF0=;
        b=GmTaHwRB34OcIz+xjegjBKK29MyA/16tauY8Vb6fwViH0hJsQhmVBkaWYBtHdgRpzD
         0U53NHiD/EkMFTRXjb/4Ahu5TjSA4bBG9Qazh+TrGk+sjv+3jSjOYWpGYoCQ+idweLw2
         zK23tveIU87GA1AbvkVPOwUanIusChZRC5jhgrqubdB+Llyz5dqK9P+4wD5x9sAds3HY
         5kkJ+AtazH5TADtplehGHHxTSJhdZsKPSfJhYqFpkmZnFKaGlM58HYAJMPlgnJWTlZd2
         OJtZ7H9/BfP8nToA5dI6pnrj/istlqAIZ6kZztA1YZHpSb4T+gUijM5/VxJXED/nN4oW
         RGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792283717; x=1792888517;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EH0gDvSzc6w/u1uhbFkTvLvSWpp8Ypw96bljv6WuNF0=;
        b=ejSwJ54ud3CcYB1/jg1L3ddwLaOlQ4k2I7l3G6VxZ35453lUm6dFPR3cN873wf/WZM
         J4PrcpEL8jRDQ0SFMco/3WRb5SEaYxi/uvxJec5KKr4vR4jF81pHvNOhZ2jQ3WbgGPNs
         qJH6LdB7AAJVSl8b3N+CU9YbWPDhVa+iud3Z1Tk/jJG6CwmLtNx3c2Qp9ZewF0ArGvni
         GPF+0OMBrcf5M4iVT26kpNVXl13MePFyXYkn4Zj+0M5PRrz0Mjc4EYqZLehGKchUMsYz
         9F7Rxf+SszXvfCZr9RO4STnW8XL8p8b0DnPchQfTyIvsAjD4MvAfdahKpMV7KEk7L2Bx
         Im3w==
X-Gm-Message-State: AFq9FYLOoqbGXW9KSc2D6tWC92odHdRhvw+vroKTjrOsIej+edGJ261I
	MAio1KbHtqViDzrPt9zTkZARDCmRQV43qQgZZ/BUClnp0dH+ubF8E8s4BIHSug==
X-Gm-Gg: AYBFou2OFHRn4ntRINpkBK6b3ZMzvnGEoixymPzSfDTL6vtA1XJVtdM5cG8hKpiOdx3
	l/ZbWWrYdzxX3zius5wvfyv0jn3yziEjHURUq0UdVRCxGKhZY1xAAnWHlU2mZyag/8L2DdgMe5X
	xT8bZxiTu0UeAYBUidoDaykQVOOEtjB9++6Iggw67s92EKoUTYS66HTZyySauFEth6ukTXcTetZ
	hd/y7003tOBdVeb94mqIzMjZAjOzYs1blzb2fHyVSQMM1RaVXBJFSKCrFVhRvnPb4aZn/blZxyr
	9egNVqBLLlj9B2sXoJOrvozta1YKv+py5Swi4dmrxKunlFw1aq+yCnCaDG+w9303Q9FZTGMNSOi
	kPNNqbqj1e+H+5lE1lL40O8D0CQtkpjEo2relgyNMG9lEOFd6yhkz7OEmKhVfO1BX57rJH1UCRn
	nsY4dZ70EXINDhEx6e21W8q0+aNXwRpxQ3N0IB53AypQewHz4bnyYd7gkTTVP/uFfacdo2FW3e5
	XklVrUvKW2mNOpaGTVFusZnvQ0MKMXHh21d73he5KZVLhOhFgdIrF1gm2NZwN2dAbr1LlXsR6gU
	7LU=
X-Received: by 2002:a17:902:ce87:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2e9a69e7439mr35618735ad.22.1792283717022;
        Sat, 17 Oct 2026 17:35:17 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8aad3dsm24408635ad.64.2026.10.17.17.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 17:35:15 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 00:35:15 +0000
Message-Id: <DM7JJW2KF0F9.20SESIVIYNMYU@gmail.com>
Subject: Re: [PATCH bpf-next v3 11/16] bpf: Refuse the prologue for an
 extension that cannot take it
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-175849@kernel.org>
References: <20261017230950.802052-1-alexei.starovoitov@gmail.com> <20261017230950.802052-12-alexei.starovoitov@gmail.com> <sashiko-outbox-175849@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, Oct 17, 2026 at 04:29 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
> Could this cause a use-after-free in the caller after the extension returns,

Yes, for a target that only reads the packet. It's an old bug, not from
this patch. Reproduced on bpf-next without the series:

  BUG: KASAN: slab-use-after-free in bpf_prog_769e8c14b3a52c7a_t_read+0x386/0x404
  Read of size 1 at addr ffff888104c61e3c by task tt11/102
  Freed by task 113:
   kfree+0x161/0x500
   skb_release_data+0x2dc/0x340
   consume_skb+0xa6/0x1c0
   packet_recvmsg+0x4b3/0xa20

Two corrections though:

> skb_ensure_writable() -> pskb_expand_head(), which reallocates and frees
> skb->head while the caller still holds pointers into the old skb->head.

For a cloned skb it only drops a reference. The old head goes when the
other clone is freed, so another cpu has to do that while the caller is
still running. And the caller can only read: a target that writes
to the packet has its own prologue.

> If the target tc, lwt_xmit, or sk_skb program only reads packet data (or
> clones the skb via bpf_clone_redirect() and reloads skb->data) and calls a

bpf_clone_redirect() unclones the skb before it returns.

> and should an extension receiving a prologue also require the target function
> to have changes_pkt_data set (and set prog->aux->changes_pkt_data for
> subsequent BPF_LINK_CREATE attachments)?

That alone is too strict. It would refuse
freplace/test_pkt_write_access_subprog in fexit_bpf2bpf, which is fine:
the target writes to the packet, so the skb is uncloned at entry and
the prologue of the extension does nothing.

Will send a follow-up: refuse such an extension unless the target function
changes packet data or the target prog has the prologue, at load
and at BPF_LINK_CREATE.
