Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913053;
	b=I8fg1oXYs+AK0dX6TpqMKpFV9V5EXNJIC/2aljWd71YaPfgtVoSX0AJIOHHaN4Ya63BD
	 5IG88cOel+iQem2BXZGzC3yRgIkbLMjI0gZGocOH9hDjDOANhClQnJXWbGDm32aHWuGrq
	 oHcKr1UUs8/f3WcyqyMhERlPbS63cYxpa0WluNMTjlEnQzApeXAOzRyQhcVkBLmf7EX2o
	 RkZv8l7mK7JH251nPxjG3TWiodZkCpf0ogs3EWNgjt1Z4y96VnjFl/g5LsVE01IyWRNKo
	 dbAkF2CFeEdGLgQ2+N8G/R1YM/kG4/d0A1u6W+m96paeKn2mUX3sUzciqMWmBnvjTwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913053;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nAEj2+zGM/3XkCWGNMk+ECxEPs91EtFhdr4yuDuoVFo=;
	b=FggrVRFx8mTxBUk+mdOK4E2/5v5gHWdU4z/gnJnso7U1tA+OnOCSQL6r4a33ath8CbAh
	 0I5dlG7KeNJtRw6ASYFX6UwZWTdMIXJh3Z4ADdMzarcESHHuA2BF//ZszdyKDJSzqrN+0
	 vsM0ufsMr+l3Su+mKskgwuvFKL242aey1EJavyQcXILqZ3acZVUWtlxzwAbLdPfAXfcHY
	 B11kAjwMN86qCwiNc+8FO79opzEhY2W46v0BG+qNUy7g/gckuwuoklF7J6yimy7D6/pP4
	 oCGgItM1iKQIy/YacD8Br+jgfCWth1njrnEWlRQVTrWgiY5drfKHljYf/3e7YtuYlhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAD606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEAD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso946694a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913052; x=1794517852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAEj2+zGM/3XkCWGNMk+ECxEPs91EtFhdr4yuDuoVFo=;
        b=qmVmtl5Q7j0biEh3Q5o50muD6ALH9vlBe25JP7pHEZqHyB/AlYRhv6P4Hok4cyzmg4
         hbEnArXhfGcRw3GoStFRRetdjR6rL36LfgDhtKjLJqQ2s77idvDM2mBoVgOo8ub/WGW1
         GmlkoTiGHi4hAQpiJraTQRn0G/4ryxToc6uIJizlYjVHC/ldgDK8UkIeIcWTqDhosng8
         WdCdrr0NiLRnbj7TxZc95VTXv1/KG7+Z0VryiY5PQE9fCdgM6mZZrfCwZgFQWPi7h/yt
         4nipvAxmRPB+PLMzxbqNj8P8soCzUnBz+hRIh2u0d5lR2EayM4x6lTrmDfVNbR3cyYen
         ClWQ==
X-Gm-Message-State: APuU4Z9JU7YXz1/lGty3mdnB4+W+r2Owu5aK+jHmh7kDhU+M+238J+YT
	bEkuCJlHfdMevgLhqxeK68MCAC938OMe2qejFFR2kUB8P+X/Z6mtlXgXTkXE7iJj
X-Gm-Gg: AYBFou2bjmW/Hz97lv3NNy5X+PG5a5SsdZfzaxmoq5OCAGA3tHAm65ayWQpihY0RrE+
	Xm7zIUWPENJn/DZ5D5dD0OYmL5fKv5iK/593R03xuH3Ag0dsWbtenFCSMKALpmBcWLu1Gta1maK
	ObsUF3IsJX+x6obEWuxj0+wEPwOLm7ERSSC4EkCHFDEO7ezsTV7YpdM/YiiEih52KJmHn/4FNK2
	uBcEu7l4eeDl3SmlbXz6TgdpGM/U1j1HN1zkseAXUWICFZsyE9smuUcj8/n+BYQpArk/mesmZ8q
	iSL5NaAw4re/ESIeOuXc5H+VS2lWqoURW5xEgrxGjye8UCM40UP+xRqLhoJ/cbDwqhgTpiroDOK
	8Z/eQvQvESP0hKxGOEiEnBGXLrc2UMIsmHA5/xtiVsPFfnFzSmHkEGJ5Qna3pDt4DxgobikhG3+
	rQ+XMnvgiD8YeGxMDphp0AQFItYe4DYv1CVXRxhU1KLA8FuYUspi5/HfHyhjAt/+Bi76n7oucaW
	D7UJB54T+11uHPzMFxWDebZ4Le4yvtz+Oz3LQRV9rupSw0epjoNn7jahNVj1K5iQ9mQQI8TqoCY
	tlxPz0TPNB3ew81p2BPRNtsI6iVJGY4W3YoftygU0csyZmECfQh2c198/iUWOt3IBrYLGcgbnHF
	Z5NcvfXDw2tYsTJxkXaH/OgtxZ6nKHtQixrmUctphx9A=
X-Received: by 2002:a17:90b:28c4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b0db7114f1mr221508a91.40.1793913052392;
        Thu, 05 Nov 2026 13:10:52 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d572e7sm5075254a91.1.2026.11.05.13.10.51
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:10:51 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f8cdd30beso105940eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:10:51 -0800 (PST)
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr403193eec.9.1793913050522; Thu, 05 Nov 2026
 13:10:50 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev> <sashiko-outbox-199396@kernel.org>
In-Reply-To: <sashiko-outbox-199396@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:10:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6OG5B43AVKOVm5k4HurTB1u4hJQGgLyvgGfm6yY56+0Q@mail.gmail.com>
X-Gm-Features: AclHuK-pj-xm9X9wgWQkxGyGq4DurFvYioljAxStC8zAaFVSdtHpwpbzJ0LRFrI
Message-ID: <CAPY4CJ6OG5B43AVKOVm5k4HurTB1u4hJQGgLyvgGfm6yY56+0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Should this depend on MIPS || COMPILE_TEST (or MIPS_GENERIC_KERNEL) until
> the platform Kconfig symbol is introduced?

It comes from the SoC series, which goes through the MIPS tree:
https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev
Until that lands, the driver builds with COMPILE_TEST.
