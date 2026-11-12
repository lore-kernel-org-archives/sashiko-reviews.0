Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483599;
	b=XNf9ebEynaxWrXoazPDxOfntuwFKbtHPeqCUm7T5c8vsn+vNBkce9x+hPhkqzir/2Zmg
	 q1Hv9hL5zjXm1CcAYQ1QtizkotocHSeXSbNpnCQv3WU5qgLIhhj5dCcusanFv2kbFuXin
	 gK6jrCLorkxOSuilXyysEa6cdYH1+vtAGxGw9iprEjyBMgdLisxUlTjTFnh1BNUgF9wRK
	 WgpG7HS8EJuwQGpplYMHQQhFcXQ2H4J0WfPyV6Vy7DYGvwrHA3Lf0zODmky9V4DuFeWax
	 Vs/U3zMKbvEUiNlnrL2fzygnrDnpyQ4TTirSyDrvM61LUUBWzTaHuTxHUirB82yBPtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
	b=kXiwrEW8v13852RphOUYtVeNfhGTkLxRZhzKH+jJDv9Q7b9yzcZNhVLARPyOuTmhTdOe
	 qPCPIX9oYEyjQh0VPgxhDFNcDikOc+fVwNpD0Qu5MR3boflM2rx2ZBWiKK362dOMbm81C
	 Z8ZKvzVbboUtQDHf+mclV174fpft4un5RtuWpk4tO/PirY1Lm4UCTfySSV9f3f3vGng3L
	 pZ0X34imfbKL3W0KdN3B4R6jP/OSv9mVem+O7AHEmP77210mlFp7FHLH4yECcXo9WnKFo
	 92uUt32Hgw3NSgILbJnvMMPpMUAux3GSLfPvZ/2bc+XgMa1jJvFNus4anvOKC0+G3LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQcIWvzl;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6E606A335
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA6E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQcIWvzl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso5347886eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483599; x=1795088399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=TQcIWvzl5tyE5QSHKujHUE5VX209jSpvJwbxN6GWydpKJPnmy89+p2hO0j8+zu3v9M
         o8BAd5mU3jwImaNnvW9eqorNmQg2mcgQ9lDJ5xHF9jVPgCWRvmFLkcrodLQfnDhLFYjc
         dDxpBIXp7syAsfNkUgA9KqZqKryP2Gd+2EtOnFnuXqXqBwNZ1z4BzJfDl0gFs/fAzhD/
         3ARuomw3wO+iK55SLs2EdayfUuBgadwyK4bJPvQXV6QbqwC9JQfR7vs517zdsZlKE7c1
         WkdYHuVsxhWWM1q84idj6DnSc7w8A6LXSeaWvVDti8tBHhtH9xL0QSWj0XBi9lXxy2FM
         coAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvzeSRN1LnFuQrjCW1cXNkgqhbYpZ/s7WcQkRBfJar8=;
        b=nI40DtWaETKTVMk2lIaivy7TG2oeO78ZADZpuHqgshVzrQUiZmHn3kXWlahHkbhLMT
         kZNdYLFZnTDVlOdh90gJRS3UE/b/8xMNdCvia8y9UOclvuPjb9i3dNJoQYzHIoZdRunL
         yTTgE4RN9EA392w6xZz0W75vLB+SxthYFiIW+BbRUG14VvD3V22aYduDe6kcDshd1sgO
         by8dBblf9Q0XvEj/q2s4Lzcsd9RsEt04m4b/7mxgMOno6LLkj6c6eV3TcOeO9lpQ96+B
         vcTI64qJS8lmcf06QmkZ2EB4uSVilLERiHsTX8Nb40RxekhCWQOQ0+dSZtoJ1OWnWei2
         xl3w==
X-Gm-Message-State: APuU4Z920Ggse7xAr0wE5whGIlncB/tW0lZV4rr+g2sUIey9wKs7y6Vp
	guS313ZEgZF0jAu4JagIJTXJicj3kn07D3RhiQ6wPJjPIa/mFbevwIYLD4f1dcveP8o=
X-Gm-Gg: AYBFou02O3KU1qqOZ0TNMyUaOeYDy0UD3C8t6rvql160GNFacoDuOfV9V0XXmXES8g1
	bCASzjYRbyl5fmFpctTASWQzZvy1LbzQ3Y2jAlj84sZOJwcZ1kt4AyX6BV3YlOgfgFyJ4qQtTgJ
	5xC8ECAylrtXUXqzigEPqCa2vSY0d2+bh3gWl+GeO3dQP0dShdXCz3rods8JCqsb6YO2zKp+xM3
	g8LDZOE7P1YqO/U7nyBFCtTjjXJDB6UJ6pKSZhWsWopEgBxv9KSyFppN2BB8yoqkWaNMbXgEngN
	5gb2J/pKZN4+nb16LZ4J5+oSPOj625OqCIbAeAeoXptFzJKp52nEE+T+CuckC5Ykvx5zW+jkF7f
	gBgLwlNxFtQaEjcpsTTGwrHnvlFxDhHHIpj8JvBIA8vh+lvaDcEeTvtie1VxzGjTBZJwPKqWzqK
	3y7KGhM+vWz5+cfpR2EgI3ez9+NUYGKDWD5GkXWEc53r4DWf/6KMLhl5uEWNPDXH1i9ef7QWjXN
	BjKzZXtkIj0dYTgZossBO8PPKxu2OvAsZeEzRW/2T+CXHKnozz8UUlcL+Z925PA67/rUNKKyCqj
	6BSeTjMuZg9aJ/oxyzoDhfxW8/lJpcq9rke9n1T1c0J3AWhtIyo4gFivphU4JsQ=
X-Received: by 2002:a05:7301:4902:b0:376:f63a:cb24 with SMTP id 5a478bee46e88-376f63ad124mr4989397eec.3.1794483598526;
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50308720eec.23.2026.11.12.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:39:58 +0900
Message-ID: <20261112113958.166-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195459@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-3-26rote@gmail.com> <sashiko-outbox-195459@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 14:35:19 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
[...]
> Should state->mode == TYPEC_STATE_SAFE and TYPEC_STATE_USB be checked
> before inspecting state->alt, and can gating qcom->dp_only on
> !qcom->dp_active miss valid transitions to DP-only mode?

Yes to both.

typec_altmode_set_mux() passes the DP altmode with the safe and USB
states as well. pmic_glink_altmode passes no altmode with the safe
state, so this did not show up in my tests. v3 checks the safe state
first and treats only the modal states with the DP SVID as
DisplayPort.

The USB states from the DisplayPort altmode driver (exit, removal,
configuration back to USB) all follow a safe state, so they now switch
back to the PIPE clock. Always selecting the UTMI clock for C or E also
covers a change from D to C/E without a safe state in between.

v3 also always selects the UTMI clock for pin assignment C or E. It
keeps the UTMI clock on a change from C/E to D/F while DisplayPort is
active. If the PHY switches then, USB 2.0 keeps working and USB 3 waits
until a USB state follows the next safe state. The PIPE clock while the
PHY is in DP-only mode would stop USB, so v3 errs towards the UTMI
clock.

> [Severity: High]
> How does the synchronization between dwc3_qcom_mux_set(), system sleep, and
> runtime PM handle the following cases?
[...]
> Could the clock selection check be performed inside dwc3_qcom_resume() (so
> both system resume and runtime resume apply any pending change before the
> core resumes), with qcom->pipe_clk_lock and qcom->pm_suspended covering the
> full suspend and resume sequences?

Yes, the cases are real. v3 follows the suggestion:

- The mux callback no longer resumes the glue.
- A flag set under the lock at the start of a runtime or system suspend
  and cleared after the core has resumed makes the callback only
  record the state in between (cases 1 and 2). If the suspend fails,
  the flag is cleared and the state applied right away.
- dwc3_qcom_resume() compares the recorded state with the clock
  selected in QSCRATCH and switches before the core resumes (cases 1,
  3 and 4). v3 has no cached clock state any more. A change recorded
  while the core resumes is applied when the flag is cleared.

I kept pm_suspended as it is, because the resume interrupt handler
uses it.

Tested on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali); details are in
the v3 cover. In those tests the mux state came after resume or needed
no clock change, so a recorded change was not applied on resume.

v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
