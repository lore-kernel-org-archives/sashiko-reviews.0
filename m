Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B682F4183BB
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012582; cv=pass; b=FhxnxQj5I9hhJiCAi7OBTd575GS8pdpl1JPwmwJPp5U3/WK+GQLST0DXf/oeNbuEwi9TLqrdOPI2nGH+aLHeo9DJIKs+4Ys5M6v0pYPlpKkgM2jbG4qSKja74IrGSnu3QdPokoDUbvqUwidDUVhG0B+R8dOQdUY4TJuOxUjMIDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012582; c=relaxed/simple;
	bh=il96Vdi4Eeogfn34vuw3kP9ywrKOL275SKxMEIOyGko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9mSihgQV3wnrfxa5HHA/LxbypAC/3kfLCtRpyhTEkkFT8qBfCn7rKBWY/vWW/pTqhrrZhc7/4tCIuhUJLmfitgnxWzrxeDtIDKh82IMgeCrSCeDm47O74kBoiy8ozwaqGVDqXLE/L0q8NdL79g9yWseykKtf7MWvAfE8TTQktU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPaRhc3d; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPaRhc3d"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd497007so362270c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 06:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781012581; cv=none;
        d=google.com; s=arc-20240605;
        b=bpuTJdnFPDsb0Spa3yKNm83BY01OAiOWk4rX36DGcIAp83dab6KkQ1TzNzsV08zIrQ
         DJm5ehJez7BvQoCvjLq5mGRx9tGv0mF7xZJFO1OdT0JOEhTzVjVAACP3azcsslwCR7Hk
         6vqJkj0TncXE01RpW5eDHjD1eSA0Bnm+HBfH1QZCrOHwWqfJLUl+4+htNxWak7Jri5pl
         yavs+E0TN/loi7pfUy1iwh5OjLfolbrY7+hCvlTw0lUYeR6kObcostQJNf+4Vih5JMB+
         PqUtCvT+Nn1soDeu90IoIFcHuaW5XIaJNVishBUFUVIsyWAl9jZ2W1oLcuKAmvI9OX9L
         vAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        fh=awREEgKAOVF9J19ntnYGnwMPLbldjx5IvRvD3mzj3wU=;
        b=BsKaxdvpFHKflLHzusl92oYCN5T8DB05/kFWjWd4daJJ1IYoAmfcE9PXEYheiLVIhd
         WR17eGSUhiq3lH10B7jzzFk1fvHS0PNSMEKQWafZzUXa+zZfnwvZD5Z9qECzRaQoI8nO
         M1GCMT5T+TwCFXdEO8RMnGFGrbQEI1Paw2PAsUYqnouIRYxBhmEfMXzExWSJ2ACzJQsN
         Ylcpsi7zL7gxP6cmUVFJJS/8WeYa6RkmeJa8WWHXag7rJjgx4v5OgYITcRiAWahUdbNo
         kcx3CUsNlWfnsq9JLLZeIYzwIrmpYWqjCpkU0C8FvzOw8VrkKCRjB2Bo4P6lk9kjKkFV
         zc4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012581; x=1781617381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        b=dPaRhc3dugyopZVV0/T/lCvoQOIwsR8W7eKDobXNWpkQ1gFc5lg0fnSgnD3tk9ABbt
         NgNwXhmhlMheZkYUKSVKkRXGdodVvDYyswvaAeFXb1vT2uXkFYGLeClScOLhw1KX7RVp
         aSimY7lLxAYsso2luKpHgNlrI2Pn0hxWIEHHIe9hqtBEkNWBpviYosKExfyzFIuR1pK6
         3Y03ezVXicz7Qv+P3lc4EKsdpZM387H6SH4Cz+F21kV6jRR5r4q4SvfAwDgFAkGM/qyB
         j/NkMA497IPQio3LHnsWOssrwxZY1zu/sYr7j3g0eaebPTJkP9LvK4QDQ1fRJjGRzibg
         JlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012581; x=1781617381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        b=et3MjjEx3cNEzhPRR85RIAuEtBlXWCh7rqr5sdXNEBqtJl/RG7hYQkfgwr0qAZHKna
         clDrq4Q0DcLDomHGSW1P5gZreRiyhzS95cBM6ZBz6ns82gdEfzYDp+gGfrBr+SZccHno
         ZZFYmyRQO59lVdmr1nZl5CjqV+HnYybAe+353VtS91OizoKXEEwBR98gJHfwu/jyLW3I
         E349nUBTN1rXp/DWRkRF5IJlhDjLCJzTr8Z55GBiIGyj63lSZeIWOcn/QLZGMBDbp7Y1
         4GBVwvt804e7f7f78RWki7LLUprWhwq2/ewX8miB0y7udSkFCb5L3tzw8cXeKO8QgijT
         vjXQ==
X-Gm-Message-State: AOJu0YwdJhYWxsXlvVYH9MiZiT3/a52FGKThb7dak5qr5YEmKxF1UhjU
	v+tHHx1uTl1MOseRqOyYHX7ljl50UmKeh0UmGlE/3yXLI5xI/pfaiHCRXk1zFYe9HMngQuLUhsY
	KE3akBv5gvVO13BL9LHfP8x86vbzbo6ZGSuF0
X-Gm-Gg: Acq92OGptkY/zZ8z/+0bep280zwsqNc+Oc3muF3TS6vIIi1eo4iYD3DItQAw2wbGTHf
	WY60GhMn+75E5FvHdgrL48PrZbfKSt6UQ2qVCZk88t9/XiR6VS3+9ZUvm7kDsmIVkZTXtrghpH0
	1mD82QN+bv8xSrNYBntWYcQU4VBoQXNapC6h4xbB7sD5XmSBp7/i5Zksm22/AOt/R3sD2XJzaQB
	FkzH6iNZAo1ImPveil18y6kp9d0QobIPV77aoIyu93r2JSVkSQnTQ94WpiNzbFZFekxa9PpT3P3
	MtGg+q8Pcsb4WUSjFaG3snfutpfoQR8/Heiq61iPPj7h/tBl865Mfm3mqDNpSPlwDIbj5g6tVUR
	GZIgV+ymNJqxiS2EPz6/kIoLy5pwUdmJ3JQ==
X-Received: by 2002:a05:7300:cc0c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-3077b77c96emr5815587eec.6.1781012580802; Tue, 09 Jun 2026
 06:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609120325.233721-1-gary@kernel.org> <20260609121103.385001F00898@smtp.kernel.org>
 <CANiq72kAvoGgG2jG+bHs56z0C=Gk6UUHKQTcuTAK4+WqnVePzg@mail.gmail.com>
In-Reply-To: <CANiq72kAvoGgG2jG+bHs56z0C=Gk6UUHKQTcuTAK4+WqnVePzg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 15:42:48 +0200
X-Gm-Features: AVVi8CfvPzZW2hkFYp1AH2CNOs2Fqw5fK2JVut1TtN-0H3ulEKA_NS49W8oh_oI
Message-ID: <CANiq72kH9dBAbXZ7=cpNVS7bPj7LeGkkv0ca7uTzkut2k0P8zg@mail.gmail.com>
Subject: Re: [PATCH] rust: mem: add `Align` type
To: sashiko-reviews@lists.linux.dev
Cc: Gary Guo <gary@kernel.org>, ojeda@kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 3:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 9, 2026 at 2:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > > +/// # Examples
> > > +///
> > > +/// ```
> > > +/// # use kernel::mem::Align;
> > > +/// const ALIGN: usize =3D 128;
> > > +/// struct MyStruct {
> > > +///     align: Align<ALIGN>,
> > > +/// }
> > > +/// assert_eq!(align_of::<MyStruct>(), ALIGN);
> >
> > [Severity: Low]
> > Does this doctest fail to compile during documentation testing?
> >
> > Because align_of is a function from core::mem and is not in the standar=
d
> > Rust prelude, it looks like it needs an explicit import, such as
> > # use core::mem::align_of; to avoid a build failure.
>
> Ok, I added a section about the prelude for Sashiko:
>
>   https://github.com/masoncl/review-prompts/pull/75
>
> I also noticed we can clean up the prelude nowadays, i.e. essentially
> undo commit 72b04a8af7fb ("rust: prelude: re-export
> `core::mem::{align,size}_of{,_val}`") and clean a few other cases. I
> will send a quick patch.

Cc'ing the list too.

Cheers,
Miguel
