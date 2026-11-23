Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466454;
	b=2dj621wFrxl8w6H8uX6KxOQlxzqevZaUBUV5aUW69HK7meSc/ggVpFw4f9MG1GMI/iF1
	 cJH17p6aqrJvcwC+AYAJsCdrReTnYM+HCr42r7DjndTDKJdqZ7Hj4B2UDUITvfabJThna
	 EnU7ouGOyXVnTnWj2WQMNEV8svskQsgJp6EVFgcK+ig3C+O6fxuEztw4zyHdDXxQQcUnQ
	 5vY7TpWb8Y3jjGSYPFIUjAa+l/D98hTwtIiawCGAxyaoQKlMWPE4f7wZjvSXOlnIGFu/c
	 xsl/U3CYttIoGxdXZhWvrxbrlF3BsfNatNHYWHgsy9mO2Om6Mw+DXMmj0NW8lJCQkQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466454;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=656j90knWebYst0jQZVxiCz3q4DVhvKmDJLy9bbfaDE=;
	b=ej2JV7tdrvHWi/8suggpqW8UsDlL+L3awk+1Moiwhb+amolmGjuk02rmcuDT4jwALAyt
	 9IqJjw1mduonD3jKxtchPxVPXsvDMQ+6Jv7De7lVPaCKtHgjaeE1xmPYXoAXeBLK66PmV
	 Etz1f5tepNGAfOmrN0zY55nmRaK9SV0SGpKucjZOFKSnj16BNDV2ZuogdkEVeW9EhX2dM
	 5Nix0UKauKhaT/FGbhvwWwY/Yviv9iN1SDzCk5mXuq1g3MAL0Kj6qRZiNaZTixRh76tPX
	 UrNqiblE1oVQ7LLeGrZmNkT9MmS0mAMVbpgTX7KZhDE2sF47AiA5qbpTc5zOs4K6olg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XdBH+7Qh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A9606A688
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385A9606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XdBH+7Qh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795466453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=656j90knWebYst0jQZVxiCz3q4DVhvKmDJLy9bbfaDE=;
	b=XdBH+7QhXpCYkQSLntPHgrOrf8yP10HQtBiNcXREOsa4qeFzlAkqjOgYhomSTwkCHYDEbC
	+tffyZl6eP6Sa86CNezrmdIaWAusROwQfGPvH8/8cVcE6VEVryvQD6t4LGQY3DpNGXuIE8
	vgcoufzAlcRdjB26y1kN5gSmauQtkTE=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-fAgLQG1ENyWpxYaDIkddHg-1; Mon, 23 Nov 2026 20:40:51 +0000
X-MC-Unique: fAgLQG1ENyWpxYaDIkddHg-1
X-Mimecast-MFC-AGG-ID: fAgLQG1ENyWpxYaDIkddHg_1795466450
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4645668eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 12:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466450; x=1796071250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=656j90knWebYst0jQZVxiCz3q4DVhvKmDJLy9bbfaDE=;
        b=A2wUoC5RSWzX0+PbuzjJrGYCZXlO2xzS0L9b/1gd6m4uEnDTxqb14TaAPhA5UKGonh
         e62M8HB3wg8NnBPIXaZwomBuQfaWUs0A9zra5EvznugfrTa+KZx6PNN+A77eugPFlhln
         JK5ytFyH04QnKOUwI17QIfy6fUpAfFhRLZp9ay6JbeIeX3r32F8sbfu46c4FW0bgHDQf
         weh+jwVZJQiSPCcqTHqxWByjFX48BrlvZQNFYLYEsMLCQdmCMfFwtVx4QzcGMspnNwf2
         QSizjmOU+qm8VI76hBt90hKQfGyK2Gld+UxURBDXOTL/hyO2BzsruFCka7Q0RNPkgUJT
         j5pg==
X-Gm-Message-State: APuU4Z8SJHWpw0rcGScmd0ZXbsB9WZFJruG/ktxDVSsM3duP40mQE8Ho
	f70JHOStua32QkO7Ypd12AnGJcxYMEWi+xwy8PwjqG8xSl594N9TgCJQc8QWNlw/5YQro3CswKj
	aJrc2QQU6v839mv4h8vT0jq9M4Xng/UadnCXw6QCklK493J6VBmbc1ustcZD3Pqb44FYdzkrAJe
	V8dz3mWCX8MyTTlzvFQBPz787DPbRva9Vr4eEfqHNam8+CWwkaYRRu
X-Gm-Gg: AZFdTZc17Jqisap6Q9yY39J/OrZ4I0ipvEJ0CW9/xfYJBXR+8FWWkL0wSTDezX36QT6
	h5IazHNG0B7eWuy6yJsNCYndDnYu3E6WF0yia+NACYMzMJtTvQDT4X4yLlunn5h0uwf6qvP5Dk3
	kJWrgGdsDideGTFCVQLJl29CSYztmZTMsSn1jKrGCryevwneFwxQ/oyPAe
X-Received: by 2002:a05:7301:85cb:b0:381:edba:caba with SMTP id 5a478bee46e88-3856fd5cceamr14425156eec.17.1795466449727;
        Mon, 23 Nov 2026 12:40:49 -0800 (PST)
X-Received: by 2002:a05:7301:85cb:b0:381:edba:caba with SMTP id
 5a478bee46e88-3856fd5cceamr14425137eec.17.1795466449240; Mon, 23 Nov 2026
 12:40:49 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120200040.257152-1-aahringo@redhat.com> <20261120200040.257152-2-aahringo@redhat.com>
 <sashiko-outbox-226084@kernel.org> <CAK-6q+iQSn2S68FgHNNT5+vB7zTGnNN5Duujk6zU9HPP5ckgMg@mail.gmail.com>
In-Reply-To: <CAK-6q+iQSn2S68FgHNNT5+vB7zTGnNN5Duujk6zU9HPP5ckgMg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 23 Nov 2026 15:40:37 -0500
X-Gm-Features: Aa3M54rJth5FztZiScMYecJH5sszJMqj-IHjfRdlNObFng_Q1wDluYLLGTjFIl8
Message-ID: <CAK-6q+j0imuGwDydUX3BkWhVMo00C0TSgJ2i4CUy562YmUiCqg@mail.gmail.com>
Subject: Re: [PATCHv2 RESEND v7.4-rc3 1/5] dlm: fix socket hang on send buffer
 limitation with socket error
To: sashiko-reviews@lists.linux.dev
Cc: teigland@redhat.com, gfs2@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: otN_B8vW8ipD3wECytEIkma_zB9JmW_wt1VoJjdMlyc_1795466450
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2026 at 3:38=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
...
>
> From what I see in the context of the othercon, that second connection
> "othercon" will never queue swork as the primary connection is used
> for connection "lookup". The "othercon" logic is a mess and we should
> have removed it long ago, as I am sure it causes other problems. I
> added a TODO a long time ago regarding how an othercon could be
> introduced using a global DLM pre-known rule where a higher nodeid

* how the othercon could be removed using...

 - Alex

