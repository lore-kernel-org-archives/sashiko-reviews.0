Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211130;
	b=eaCRvIXUqjOx5Q/KJEidNMotXQT9RTgNUs9vFtuREPmc3YInqzLaMMDSwpPNfP377sWL
	 epUaDajbeMs95zgtqH5OFHEIPqP5qEPNEXI5M44Xry0eoC6hdP+gfD9NduBH2gxs07L/5
	 Sp+9YgUSuXxCsjmMeUBFLmkinZPG1PDys3klBUcFR8P4H97Yw1RpUqYVZslRjBqUm6JQU
	 DdPmNSZasPY+vU72t2vuF4da+DWlW3z9dOQ5PHGI5j8DbN8QLSprOk0737KoConkABWsI
	 SX0fLwserYw3kUFPscojnTIu2E/2gkCwB2USx/JycY1/PPxz36Pk1jr+5IMEyTdyeFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LaRGx1dNEWPdR/HUW5QFXw5geXVqN0PcRJZxfDPcq4k=;
	b=x9CkIuDLk5OS0qL0Z8TlBP8/BI2NnJC4duqe1hrWpkHkchbWdcI3nFs4i7pGVBhhTNst
	 aSFPqrOF/rAf58AD5wqH83CBwLxVvS4r9AtEX9ZWKzh4kc+lZ3m6DiqRRT48Jrr5eH3XW
	 pcUjx0t89iXhy9y+HJzWoJYncbrgxDuT/vgyV5GRX/eqSP6mlx2iyOkRIIxQj+ubG4wKy
	 Q/2ahJV3FLPkzXdKUNwv/Het69WdTQWfmR3Ipk22ezx4fQPJCeASRqemXVRSbKrZ9BaGO
	 mYXvO+F8JM8nYZD5saFgZGh8YPoOXb/7Jyen+yaZPg945QwyYtoeSwzqkv5BGtMKwEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zk+bLpMb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF91606B458
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 18:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF91606B458
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zk+bLpMb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1968970eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 11:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211129; cv=none;
        d=google.com; s=arc-20260327;
        b=Ds/z8zUUlOt+FUBr+T03QvEH3CA53FnvncRwXJ4wdhE6VBmJW29fzgSEa058K6mf8j
         4rx1D/PmBhbhPazldUBN4pFtXGzlevYKl6jfa0oMtPQcDCR7hfJ2PomRP7L62RJoXLQL
         SZnQW9hpgFt+eLX/c5Zz4P8zXJKdlaOGTh/1iprpyE6Rmw3PV511YJ226fAZ4mC/5q2W
         ConPwgluHi871sg/Kst2wEWIz9No4WAPET0Igf+ZLRzjKNXWKh7UptU0ffRbaWgHR9WU
         FThnM3oTpl2Ce/ZbU+NcKOdw2vgjP5wPwA/n1yHAUKBJSoNAtLco7w1/fQLpq9D+esPv
         ag6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LaRGx1dNEWPdR/HUW5QFXw5geXVqN0PcRJZxfDPcq4k=;
        fh=VPgln0uFUbKdQ4TdIV4/cJOLXPC6kpgaFquVPTX6pe8=;
        b=d9LMtCZc1ShH1kIU3J+tS+ghMVxWSATD9HBEhV4NQdeu7iKKrc8S0dv71eFrBQomsC
         C/sbe2on2E0ae4mg6jjk11ug2RN0j/wkEuwH9AvDLsmNoviieEFkeuuSvKNcwiJ3hVlU
         /NP3svnIg0Vh+sLZzUxhSyLvJQ/PjSRbM4XWMNlRLZcOFOiR4YB/PeXsa9MI8dxoEIH6
         uP2/BFMl2nfLiO7dUjtiTj8PIfZl567ipQhgTFM8wqo0kQE47dgsuHDk2OqTC7P0Q5Te
         hBABRI4ybfGxrgfduRAuACiGtJjtV6hMOgXZ6szN6tpgetPMjPMhgCU1v3RLf66x+naX
         JUOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211129; x=1793815929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaRGx1dNEWPdR/HUW5QFXw5geXVqN0PcRJZxfDPcq4k=;
        b=Zk+bLpMbDFctHtjAj0U9rVjmAEzpcMpoaloGOSpRuN2hcDWs5DDxWLJkoOqq/2UBTU
         QKDzqwjOc9tgpjGfzOfOwHuYSFQ7drcVi7aCrzIIxoiVXU/aUr2q/z/1exglMSf5VDkF
         oX5V8559upcnpRiK/MV84k8jUubq+p9TmbiB0seJGRiIUIXLpq6crfqlmYbWJ0U3FbuY
         1qF6kWsOiju0d5dTk92chJ19Xj3AG/CKv68y1vCVN4bxU0uw7wYeXiRYjyj2yWlHYsPv
         Im5yklUjl9p+OjuAtWFlpqJljRZUlUA6UplLa36LQJEvOxx/YB/GONx19BHXa1NOb0L6
         S/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211129; x=1793815929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaRGx1dNEWPdR/HUW5QFXw5geXVqN0PcRJZxfDPcq4k=;
        b=k5GGYcxjxS2QnB/O3LWytjqcnLxLURRk5xNd57cHGAVG/qBLVLzM6CeljWFvfV9Thv
         JgeWU1CqHz/wz97RcCEQiH5olrY4/9BepeilTcMkSYLZymHziEhRcipq8qZnlHK7+z5s
         iVzzMcL9wF9qslrw+N0+KfTxyT+xBjLiCB07NbG4nUteu1gDnF4mnzNJ6y6rfoAfT/j7
         aeabUa1IWJhwcLG0lLSBBbrUZNQECl3ehytGBpsAFTUtRsvh9baYvjpQmbp+O8NfH8NY
         WhOAguyA9ZOlb4kVBMCdzDoSmBJwRET9OKZ6uKYkxW074q6RvlqlKnYChSwGh6+WrFab
         Vp4A==
X-Gm-Message-State: AFq9FYIv1fNaWvGrXc4FIsJ4sqLQCUIEpaJ3WcNZAiE+da6rUvdc6jLl
	qxuC2rs5Etifkpm2dsh/QNPcGb3ZQzs2g8L+R3AWl+/E3oSZYEnuH3hjS38Z1UWlIeSUnVbokr5
	zNtgEpK3h+E3rfwEAlWlgHuCbhof/TpofJlQe3jY=
X-Gm-Gg: AYBFou3MbzB4k6M/yO3VP6kIPyYAHtxQPSaXgrNBfmES7u5e2MRTfBfFIAkzSEI6SDh
	QuxN3buClTi9je3F+2Fl+EyZMeH10hFy63C90wE4eK9OqlkvsWNSdY9RflhlEf2QM+dITCLICW5
	0KSOeFPKgmV9yBAMigmRDf2i63EU1YbQo3fR+97E5A/FyjWZI25cxwUkgr1aUYzImL58xiKi4aX
	Zlf1fhtniaw91l/8SLvnh79MBWpYh3kGCdr0xjexjWT7J/QCeY1xRt3JNUzaPl2MJKQbgawFdzf
	X4nJ8xn8WLB3OKzDdSD4bDPKdPkiNbPQDPJuR3sCcpYYCfHEPEppykezAjllNh5s8KpuumBx764
	6MZXX51hRKGjiHrzAMYpXl3sb3LxH2CWDJJuxSbk=
X-Received: by 2002:a05:7300:e9c8:10b0:36a:18a:e02f with SMTP id
 5a478bee46e88-36a203d2f99mr5121130eec.28.1793211129415; Wed, 28 Oct 2026
 11:12:09 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
 <20261028164539.3471833-6-henryzhang62@gmail.com> <sashiko-outbox-188230@kernel.org>
In-Reply-To: <sashiko-outbox-188230@kernel.org>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Wed, 28 Oct 2026 11:11:58 -0700
X-Gm-Features: AclHuK8-5DUjhx-8H0W2_S57CeLeTF3woQXvHvgC4ykQsqxBjId8MHZi9iiIIWw
Message-ID: <CANTW0yq2H=SjZY=zHZnUQWB5Mf6yfD+Wy=CMJ3saKRf7JhjYaQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/vc4: dsi: Recover from a timed-out transfer
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:19=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
....
> [Severity: High]
> Can a late or error interrupt race on dsi->reg_dma_mem in vc4_dsi_transfe=
r()
> before disable_irq(dsi->irq) is reached in vc4_dsi_host_transfer(),
> corrupting DSI1_CTRL before vc4_dsi_reset_and_restore() saves and restore=
s
> it?
>
> When wait_for_completion_timeout() times out in vc4_dsi_transfer(),
> dsi->irq and INT_EN are still enabled while vc4_dsi_transfer() performs
> five register writes before returning -ETIMEDOUT:
>
> drivers/gpu/drm/vc4/vc4_dsi.c:vc4_dsi_transfer() {
>         ...
>         DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
>
>         if (ret)
>                 goto reset_fifo_and_return;
>         ...
> reset_fifo_and_return:
>         drm_err(drm, "DSI transfer failed, resetting: %d\n", ret);
>
>         DSI_PORT_WRITE(TXPKT1C, DSI_PORT_READ(TXPKT1C) & ~DSI_TXPKT1C_CMD=
_EN);
>         udelay(1);
>         DSI_PORT_WRITE(CTRL,
>                        DSI_PORT_READ(CTRL) |
>                        DSI_PORT_BIT(CTRL_RESET_FIFOS));
>
>         DSI_PORT_WRITE(TXPKT1C, 0);
>         DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
>         return ret;
> }
>
> On BCM2835 DSI1 (where broken_axi_workaround is enabled), DSI_PORT_WRITE(=
)
> calls dsi_dma_workaround_write(), which writes the value into the single
> shared buffer *dsi->reg_dma_mem and submits a DMA transfer from
> dsi->reg_dma_paddr:
>
> drivers/gpu/drm/vc4/vc4_dsi.c:dsi_dma_workaround_write() {
>         ...
>         *dsi->reg_dma_mem =3D val;
>
>         tx =3D chan->device->device_prep_dma_memcpy(chan,
>                                                   dsi->reg_paddr + offset=
,
>                                                   dsi->reg_dma_paddr,
>                                                   4, 0);
>         ...
> }
>
> If the threaded handler vc4_dsi_irq_handler() runs concurrently (for
> example on an LPRX/TA timeout error interrupt or a late completion
> interrupt) and calls DSI_PORT_WRITE(INT_STAT, stat), it overwrites
> *dsi->reg_dma_mem =3D stat without any lock.
>
> If that happens during the read-modify-write of CTRL in
> reset_fifo_and_return, the DMA transfer can write stat into DSI1_CTRL.
> When vc4_dsi_reset_and_restore() then runs under disable_irq(dsi->irq), i=
t
> snapshots the corrupted register via u32 ctrl =3D DSI_PORT_READ(CTRL) and
> writes it back at the end of the reset, leaving DSI1_CTRL corrupted (for
> example with DSI1_CTRL_EN cleared so the block remains gated).
>
> Should disable_irq(dsi->irq) be called in vc4_dsi_transfer() before the
> post-timeout register writes (or before reset_fifo_and_return)?

The race is real, but it is not introduced by this patch and not limited
to the timeout path: on BCM2835/6/7 DSI1 every DSI_PORT_WRITE() goes
through the single reg_dma_mem buffer without a lock, so the threaded
handler can corrupt any register write made from process context
(transfer setup, the bridge callbacks, the existing reset_fifo_and_return
path). Moving disable_irq() would only cover this one path.

I'm sending a separate fix that serializes dsi_dma_workaround_write()
with a mutex, so this series stays as it is.

Henry
