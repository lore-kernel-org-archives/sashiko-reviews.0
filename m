Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756735;
	b=wT2JARuYy4oDP1QdTp8uHH82vQeCYTUVIgp7ufHusBumZ8r1VY08ogcuFm0ZM8wYjwsn
	 AOZpMB+Tgr+7WVwTnOnedWh+P2J+CkP3waDaxfXAjA4BdVCzqo8rZeauRG7yMsWQd4qYs
	 rHV95uJ19BKWSR4UMC+/ZtrvBH2HiYCDfI1iyR9UbKNqSoYMeSAHQN4h581Xvp9jueGcC
	 vjuZ592jez4vfp1SiE6uh4ztFg7Is1U8YXEji6B3QWovKZwsLDPx7Wl1S8Ri0DUuFxOG7
	 lxNWB+r6gKfyZlubaV0sWvPYp6utOiUlguBaOZSjUwXL9izyKDPH5nzoO8G+CjNSPAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756735;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=1CQ75Fayc3WJJFoGR/c1sesoFpc6Olc8yaz6TvmvWC0=;
	b=zlUfRzGUHHR2dsiwZWCuZ1W2ChG3xnsUzYrw2wlceYNZmAIlYloNoOtOUUg4ppu5uMpU
	 sTK3lWvshUjhuRJh91j9iKfKMTqz2d2X+raguqBmO/xNOe6mGPzLTPXfaWgkxzwikqP3H
	 XAvfrU/PVacxQ1Kea7iKgg59mqo33Xz1zahbTVVbiHKsh0pj0jdabCuMF7dRUWTxeEU/W
	 jbdajlVTVIcsslczMbrW3RgyNKgW2fI7ZqRpYmDFn3g7EZNmjCXPXfrLKXhNeaN+lstlY
	 ZQRSnFebTsUPESXhNV9DMbP3DihfAGPyIxzfiWJGaIlNKv9td7lEFxANOLBcWFih/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b="1wLh0V/J";
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C3606A31E
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 15:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=1wLh0V/J
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jSFNN4BnMzKp2T;
	Sun, 15 Nov 2026 16:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1794756724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1CQ75Fayc3WJJFoGR/c1sesoFpc6Olc8yaz6TvmvWC0=;
	b=1wLh0V/Ja/vn+KnKKRfSAVy06HI62NVm/4TImiNKPw1OxGG3CLLrkIZO8OdprPUkv6k5F/
	UOyhD65dsFcZlKzlFf+iaha6rF17hHDLfZZaNGAiFx+VhGSVUAtyNFlIX6KENbkWkIz8YZ
	udEqvSIB5PtJGsWUX+k9J9LrMDZTG8pqMFfAczUowODli+UUcVP7G5qxKU6XXKGGNYzNev
	Sp77T2Yn97heAYR42i+P8BSpnU25OwAQfD31bpl81vfCoDu2bMZAcNLn5cgjSasqgurMaz
	Ht/t+VWWMtaPSBBupRFABWUOGM0PuS8lMMVTTOW/O8Xdkb63qbHwsLKXeVy2BQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Sun, 15 Nov 2026 15:32:04 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <754837949.13288.1794756724156@app.mailbox.org>
In-Reply-To: <sashiko-outbox-213714@kernel.org>
References: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
 <20261113-abm-sysfs-commit-v2-4-5808d17a7e89@hsal.es>
 <sashiko-outbox-213714@kernel.org>
Subject: Re: [PATCH v2 4/5] drm/amd/display: Commit panel_power_savings
 writes from the kernel
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jSFNN4BnMzKp2T

> On 11/13/2026 9:28 PM WET sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can this commit drop active overlay planes from DC when VRR is enabled on
> the CRTC?

This is the same bug as the one reported on 2/5. The fix there covers
this store too, because the store changes abm_level in the new
connector state, and v3 adds the CRTC's planes in atomic check for any
commit that does that

Hugo
