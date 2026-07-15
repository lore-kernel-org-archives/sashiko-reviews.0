Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C9441636
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111243; cv=pass; b=j7PZrHW6+zLl64VH6IQjruw3dLg11OnZ+2fhnpEepdTJEm75FF3yhcxIzLqTET69EjSgTo/NBt9kMXieTmH8Sih8mjKSr6OKxV/dqv/MBLSG+lYrn07tpI7h23WBHAqgOEImmYFp2pFccrBPlFo9Qa+Hazj+5X2foP0qeVCL454=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111243; c=relaxed/simple;
	bh=Ye/9u/kfw2ldB2HnBfjL0BYaRgTTNbK1gZ0f7JtbS1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpdvF9vGrV7nk/miv1i8HHhIWiTEd+rpq51FhV4m6Hv4iiZCKllq/wEly59Y6RxuhyEXoqrVxDn+gOtRx1bH7SAWacEAoICw0DUkXaeqOrTu0pRXI6AglyvZsa83uPws3yrnJ9cnJcSYZFPgXKCV1Aekym6a5V5rVKsLj0u6eVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coralogix.com; spf=pass smtp.mailfrom=coralogix.com; dkim=pass (2048-bit key) header.d=coralogix.com header.i=@coralogix.com header.b=DNjVKo4o; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coralogix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coralogix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coralogix.com header.i=@coralogix.com header.b="DNjVKo4o"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ff20870ac7so39478136d6.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 03:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784111240; cv=none;
        d=google.com; s=arc-20260327;
        b=nu7bIKAVSAdaReSEE1wl4hmRM7dlRLvN8WhcAM3N+nRw7Q60NYdJZl7B6scWjyAkp4
         TGSpgHJ1eUhL+kzBFdOxTuK3k5yZ7OvBPWCQrM8l56MS8jxS4iA5QZNZJhLDcXfA3yVj
         U4mKiTkqH5ZnWI+ZX8TUAE23pqE1nsLJGvz1Tycy1YdoGPpFfJZuMcfkjAv5TD9Z2gdg
         5E8V+hNaBspgbpRm6c61ao21dd1z7sT2S8XmkbpDXI1cr3Ow/9SvDjTh3A0PYiKf39HT
         1zJLxb7B9kvj5K7cUnv37ffE0px7cZvr/EAW3C0idbRrmVSl+S7MJfsyy0A7st+MOU8w
         2AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ye/9u/kfw2ldB2HnBfjL0BYaRgTTNbK1gZ0f7JtbS1g=;
        fh=AnPORTJRycz1VPlUfqXDHxD/z3fnF6QPAbdgjDiylBw=;
        b=LdvIKplqrsXDq9yUIvJL83RvxeUwvJRDPkRoA4vIMe/m2NTcpR5CGwejS9iTcslCa9
         wYZ/+Xe0xnNRVHFt82PdkDNVZPwq251VFO+L+3IS4OXSM74Ku/eFLzydeqAvH5MooprR
         cTpeCVMkpYaZ+OOhhV0hbs6dc8rIendCBv2A6Hngom5lU1x0llxm0vg+D7B/ZDEbj4c/
         LJ1gz7fxkj+LWE6zKjKpFo8krtn0oDJ54ZMiYlXaEdvBRWs1NzSSHK5etQMQbgrY8ddp
         y6irBDp0OmRmrKR3u3t+/mQYs8U2jBw1l2DlJuldruegiTW9tf0tg6cQIldDvnP7tmJo
         hmnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coralogix.com; s=google; t=1784111240; x=1784716040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ye/9u/kfw2ldB2HnBfjL0BYaRgTTNbK1gZ0f7JtbS1g=;
        b=DNjVKo4oFBTM5LbXJ/qwVG6eYNup6l6kQH1dPU05jp8vmIOB9FcpGPedtIVB5j73Jb
         kJhhQHELsDjXr7BKtvLpy2hwUWHmikG6f+/CFfPsgcF1UDj24eab/7qHVSC6466pIauG
         SW72zU823HRIyxVyQy8ivh+Lg9Md19ln0lUny5Bn2F8BevFU6WDCzpHB7RIuLCETUW4p
         +Y+hWx/fvivp3B++tGbJfeHTLQCUwSBR7KnLn3VPV1q832MPotRiozwMIRbPNcjStOde
         KNSEavg0KEPj7FOk0gKCrXsgtNFugNjOA77Rh2Xrin7fuuwEjdP3ENN/q1KzdoDJ3F3q
         gWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111240; x=1784716040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ye/9u/kfw2ldB2HnBfjL0BYaRgTTNbK1gZ0f7JtbS1g=;
        b=fwVFHfcdXCtZcP+HsH5GAtI1yiAXD6UuF1q1YCVCiDmDOPyswJpt0CcBM0rvOzAiLA
         Tlp97JV4NuTDl0mYgfMrv3Wd0YD5wgVAYIok+9NQ8nmtsnREMpyQuP8Qhtnk4c/Ck3Xd
         du5v8NDfYAwTHIoFJbAnVaMwj4/ECGXuHcaBNp0CWSfTnRum1kcvHSNWFv9raZNJDoTH
         NyX4HIZOT5V7/uDq1CoeYO9MQsj4NJ1lQrlf9wofKlAO4EgonQZBPxVpV48ZoEceuvTk
         1GY9aAPwkli4lRAgR3O2S2ni83W/GARvNj/n9/kl+jCzG3LRTG/VARhisphtcEuZbp8j
         Jy4w==
X-Gm-Message-State: AOJu0YyHx5vYTGXtivUZEHqyNsXRsoTJ5bXNuN9taP7IbM0N8WEAyE4l
	8jOMbTuu+oR4rdTisTgGrXXJBD4lvvEVEUiDYWo0YQ095+qm8g5le4XCnC551uXYm+oC065AByP
	eYiZk/kUpO5Sz5DPzpb6VaDpM40eagJ7EhUB4jUOrFg==
X-Gm-Gg: AfdE7clHinBd6Z5UbBKW7MOmcKtDvGQlRG7v36Y6FnSRCA4QsJMH4ETHDsheaHlnyPT
	Ng1X9ZJf/SuvziwC9y/DHons5485XF2J7sHDNYlgE0jON/7BN+Nk7u31ZzO5QoKWqDIiZOuOPAM
	3zFEdlGei24AVJBGFd5mwB8QBpv+ppn6P6gv9Z/6q7/xJ49R92HZKZ7KiVgqbBnVl/YbBjxcmf6
	I04e5VeUtlT9Hiqjv5I0L6jVIdyY8G09s/0woiTu5OR2JQfGV5bBWqSImpCcueaxKS7wHF4arGE
	9rWkccw=
X-Received: by 2002:a05:6214:5541:b0:8ef:ec2c:6b70 with SMTP id
 6a1803df08f44-9074c84cb1fmr58440516d6.53.1784111240385; Wed, 15 Jul 2026
 03:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-fionread-no-verdict-v3-0-b4ee31b3af53@coralogix.com>
 <20260708-fionread-no-verdict-v3-1-b4ee31b3af53@coralogix.com>
 <20260708171659.8695B1F000E9@smtp.kernel.org> <alaAp3qrrn3XYd8u@john-p8>
In-Reply-To: <alaAp3qrrn3XYd8u@john-p8>
From: Mattia Meleleo <mattia.meleleo@coralogix.com>
Date: Wed, 15 Jul 2026 12:27:08 +0200
X-Gm-Features: AUfX_mx6oFAp_WKlpkqbUOQh5ytb63C69yfL4tT2SFTAbZzCUy50wCNpgxIxtDY
Message-ID: <CAOvpEWNSyn40iwJg7DRTTq0z8nFqPAFx1oakfwk06bJPssj84w@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf, sockmap: Account for receive queue in
 FIONREAD without a verdict program
To: John Fastabend <john.fastabend@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:45=E2=80=AFPM John Fastabend <john.fastabend@gmai=
l.com> wrote:
> Sure but doesn't need to hold up this patch. Mattia would you want to
> fix this as well? Otherwise I'll put it on my list and get to it at
> some point.

I'll follow-up with the UDP fix.

Thanks for the reviews!
