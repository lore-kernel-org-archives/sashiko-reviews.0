Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5449483B
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319992; cv=pass; b=PWfEK5J63wTWcepfSp1VWkZULeebmUUVyM0Zzg2Q1ISDbnDLaQkUJwatwrsnifaRTR7YnRbRMC+8n8j/4FfRFM5UHBWbkPNXWmU/ok0skvtiVM2TTp6mksPWb0dWrK4K34rEKxCf6fQGbj6AcwkOfSu4vemaqNeZw8z359Lk5AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319992; c=relaxed/simple;
	bh=IwrbM0dGxD6XKRAhQH2GAW1ispZsMa7niXHCi9W5sws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3G8p6K+HHn7giw3CKD/MwXzjFYUN3q71hrSffNXwlsAcbV9xiOHg9jYv16w3aqJx+OeRs45W7XpheJBf5PYXl0PTTyhVxbh/D+WE/G72+LB2SlBGfq+Oc53RHmGC3H/2CyOeC1zMpPL+IWGasz9UjN7OB56i+cZsPLYuPt6lIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ue/z5C80; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ue/z5C80"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a1f8757b4eso11366a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 06:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787319987; cv=none;
        d=google.com; s=arc-20260327;
        b=Ex8Gm+m1POuSzpOrgVpNyCbdNli7+TIy1jbKghaSnqr6TNE1vSc0oNU2PLM/LaSN3K
         4QGdHos8ZtASvHiMXf7pUkEjeZgPoS2v0WJyRde2n8g1pTWgPLPfsmOZlR/g3SxPdJox
         WqF98hHbzGkZWlDGVuEzhRh2l7FOZROUFN9IVjhNa3SSIIlK/DhQin9IE2LsvT+EFb06
         GhIpB1HwCpLk6SG53e2iNZa1KnVY/oYkDM8a8UtxdwNYxgBBd2CCY+W4BQpdbdiAGfQx
         PViLGNl9e5jqW+oUI5uz7S8pevxle3Gmw+SbYyTgB7AvGmUt1qwB6TzZOA0IN4YieWHQ
         bLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IwrbM0dGxD6XKRAhQH2GAW1ispZsMa7niXHCi9W5sws=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=V1O3Xz9MRedm2F3PFiuXGFIt13Jm3kJbMqiq4yEMYVCho5ex18r2TWNjHHgY0rcj6v
         5B9wqjWMGMOQk7TMVjcQZy+lgvjmaC37sbchmiowNW1vhFkKtIR75+HrEP8bAvCJJmsz
         /x8xKrlrkfPYiBV9AbBlB7jquTCV4iy2CwbSIA7Mx3sYUR6AvAqltNzAKQL/36z8gF1l
         YenPxCUinupN8U3vf4swtHDD7YNbnIaI3+NhaPt3LKU7ps258VDb7jMZxoZ+/W4BRTfK
         /RcHo1IPMo3Sh7p4wKwXqIFy+rTLgjD+oEljGyjGMYjzg9x+lf6ScZxRjUzhbNRZeBBG
         +IhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787319987; x=1787924787; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwrbM0dGxD6XKRAhQH2GAW1ispZsMa7niXHCi9W5sws=;
        b=Ue/z5C80cT1QeNXAeoBFsiqMpYexp3dtnDzUZO4DT8OY+Tc2VxMCkotAcURTl8c3lK
         g1n/wTHQM61oqjG/keBfUn7rTjAnmzhKSQdJeMogUup934JJ2ntdVLrI6PBK6DVwWR8x
         lZo6243fGXQ7XG4m3zTD+21A9Idb1OAmt3Up6TpB+D1OdW0imx6+Z48hEGz+Z8i9+MJt
         rwS0J+fxWLM0yCc43FSwHrdLylow1MudWSKkjxMUveWmwRdI6LWR6Y/u/xeG5a1UasdT
         qcXRFy1j+atti1oFseHBoYKB1C60kPZnfIRXZq8Cj7pRPRQz8YiJGOww29p6c6THTDlJ
         qXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787319987; x=1787924787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IwrbM0dGxD6XKRAhQH2GAW1ispZsMa7niXHCi9W5sws=;
        b=lUH08QaKWTtgdLndVvphEWYpVgI1K1zdz8jRSJPa+vpcAhROYin3ow6qHdDmeHiK96
         iHvu0Ptu+gqXNhpMwp3kJystFFt6nO8phmd8K0o377S6IV0ZbkwKwY4WqogUuTHE0W+y
         81DpqfUCXmx2xQhUmzIKpUGQMfdehwn8hiYeiA9kXmpoiOMskEEpWLR5exzqQlrYCunY
         iZLJuXB3KUVsuzCTQjmuMwKeWQTg6KvI/hXUCGquGOwwut8mvNT8x0AUkIchR1qcrIsW
         qqSzYwOV6aqNXM8r3jwZIsPfXqM9rCCQIwxR5ZGL2kn2JMlUx+yFxxKkUn/IdS+5pZVr
         LZqw==
X-Gm-Message-State: AFuF++m07FuCQ5FaOxLMaz3//H85xF8de6xY17KIpnx2fjVb8rFY2OnG
	J6jVF0VZ4sEfCukkX4YUU9eQtI9Llzn0GsDHlxbFX4ZSyRfR+jFSPIMrTznF3evV6JlnKd35XBW
	So1+goFWuqrvjc+ju+MyWUe1aE3Ctl/EH79F31eroV5/6rrqISdXDi+nJ
X-Gm-Gg: AR+sD11i2SWbEl0I2gVObQnQRQsiR17Nvl+OrGs3N4OjgLt96FBz4hdFdYg5SKqWx6P
	CKZq3k0lNPr0v9XHZ69rI0eZbfLSasvVbQAuqwEFCtO5Z6Bv4n+ixhtlCxr+pMhnvXvpDJ/a5Zh
	7rbzWeYNNg0h9PWHY0GepqdUiUU1rtJZMrnUGrknypYoapzR14nQssJceE1gvlouHpQnS7w9Dzm
	aaMy+sxZ3DFRSpNAaAdOXDR6dGnIXGW5JHbyP65mYLMz3GzdQ2hINo+feCCZ9itZ6LzGucVGkRD
	UAcF1UycE4TzFpKgSW9q6awS6v7946cypaCHjzPVKMIDDobtO2Wclrjsq/ybMKM2Xi8dPd3eDKP
	3A2G0QaV07Q/KBft9iSh3LzB2qi+IbACf4/vPu4FjA5Y=
X-Received: by 2002:aa7:d34f:0:b0:6a4:abe:52db with SMTP id
 4fb4d7f45d1cf-6a42f60959cmr58394a12.12.1787319986991; Fri, 21 Aug 2026
 06:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821103214.2049218-1-aniketmaurya@google.com> <20260821104537.0A1F41F00A3A@smtp.kernel.org>
In-Reply-To: <20260821104537.0A1F41F00A3A@smtp.kernel.org>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 21 Aug 2026 19:16:14 +0530
X-Gm-Features: AcwNN1X4XAjG5YKpC7qstfzTEz9oZ7e6m-p8_oUMosCM4lbHn5_lekwf5qxL0yM
Message-ID: <CAMmmMt2iymRYnd6iVjSOBGqMu+i=AqJ9g-se44XfNfP1sVB5+A@mail.gmail.com>
Subject: Re: [PATCH] PCI/ASPM: Clear L1SS capability when L1 latency is unacceptable
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Because the capability was stripped earlier in pcie_aspm_check_latency(),
> this condition evaluates to false. Will this bypass the hardware cleanup
> routine, leaving stale BIOS configurations active and causing L1 to be
> disabled while L1SS remains enabled in hardware?

Yeah this might lead to inconsistent states between the L1SS hardware
register and the software variable. Fixing this in v2.
