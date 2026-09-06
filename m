Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509B3BE62B
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727948; cv=pass; b=nR0hR1uzLI83fV/FhFGm3KJq3scujMrWn3C3QsVI9H7N34lJfYp2bqICRr8CDolZpb+NkJ14+MNrzhzeWzCickHa+rXnCoALk7M7ylkX6pawOO+fI1uVFaUxy4loGHRmLqssWbJ3LlnK925V82onugKtGsF8nF7nLeMgg0LR0Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727948; c=relaxed/simple;
	bh=SXkkL1leCpadgAIXFmuk9vFBMaL9VMcynsn8nNsQidE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zagpzyn0IXEBmLn8wxMex3MoszJz8DZ50H34B950nHTp1D0B1ag5HLXALRPNRXTb5SBagZc+L2BNQzkH0aNYtgKBFPOifuJMN4FFvW4JiFMTfDLi3U3vrWL028m7Z41bTnO8HbxH0v5cKno4iSwPv8UcWkFpzpiLKNAwJGsz3ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj/547Up; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj/547Up"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so26941521fa.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 13:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727943; cv=none;
        d=google.com; s=arc-20260327;
        b=EBBzcO50BFQQM4toZoFUzHqxfXYzu5cFyUD6TrQdJqj4iNNVGx6/tnAAgj8IAX31L8
         XKJa+1LCbjmobR4cmKD7zQ+xAICJPaWenzH0NfacT+k5yalZWwjeqDvWJxT96Z2mwiQ6
         FayL4+H/9TOvMBfbWgh7woSuRHvqcHEZZlh6QocfNySA9TYJKr+c6NGSSABW2MEERQ3j
         ssc8KqDpUejFpCsCNZrx7D1Wgkk70TIu2daPj1duGnUXZVRbFnYIbnr36OGckWrHNAyp
         EgS1x7U4C2/Bl7Zu7ddWmb8Xz60mRJa1JA0Da7UkdG3ukdLen2l6O9COqQ2r3u7czQ4O
         sWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLEUcwxYVbj+5BS/ostM1lAmEHO6bgKhQj06vkhAg0Y=;
        fh=fAUcOLMJrL6/gSlJAi6JxZuXRW8JDI9oXae6bn18h+k=;
        b=Qj18z/j+htcHAM/WDXZjXEX5+OScghyi4fPDaWhpyBarnRsbC0ISXmXCuxbB6BrUzp
         nIVNKFK0kL42s9jv7HKHdw6FdGenpvWIWlmAsPrrpMmKLK4IbqDVNDq1ts65nucx3FL1
         UD3QxUjLMIgi0ERMdz2o5cuBwUkuBORqhtvkZC66slv3hmLTmO+cwzQ5Gy3VsDFCe53X
         eh06CKKMi4gAbXjibHvvGPWtI5oLhJyD/P6eFaTdSPdvF5hqZx4ScYJNWlWeLxP0bk6r
         79cSTACTdu2xKK3k91GgCgjrq0devM9AHCKdAVOcvsuq0M3XWBcUC8u/w/X1+yeNsIKI
         eQJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727943; x=1789332743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLEUcwxYVbj+5BS/ostM1lAmEHO6bgKhQj06vkhAg0Y=;
        b=jj/547Upol8z/b9uwNtr9oUKG2aSw6qJCTqNve6lKPlthpsLirrAk3wVgbU0lLiPjU
         gRVvTdh/y2b8Wn5m636SLo6MQ549hkRS8fM2fajRbh1o9/TzqzqphUsBQ5cBvuWn8N1I
         vaajL6/yU6wVgcJ3Wpn6NUXRt5CxdYHFYb3NyIf++49iKPMJDNBBM2JmSYsalVn2BCkA
         x2QOtrWtK1R+EiDmpstL31NVvwFvqwi7gPlEvK6UlZZ4/wApba25gJ5NuQupngPAgRkc
         tgoc/udA9/yicAlqwh6VUI+6V2I6j9OXy9+b4425ux//0G2FZdG+qsOufJEoCiXmK1Fs
         xuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727943; x=1789332743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLEUcwxYVbj+5BS/ostM1lAmEHO6bgKhQj06vkhAg0Y=;
        b=aQ2BhI6V3/BXVnnbARLUFRjB9gpKl637cqcCv6yWDhwMKiqFv21G+ekJD2sBEjoKl5
         9aABWtcj41nkKyw5ON46HoWISY9u51v5N/rvxlJDRMeQNrGcxB32h9yJNJ4FifgRw+lV
         MizjNa9HicFUufYEyngt7WCLqdXSepiPOnA1kkTdsN5PF93Rf3soXMQ+Uab8gPyYbBhg
         YwuUrmPZaT5g6sqBx5V2MrSd0MWKpoKTE0P0s79t+I0nkYdqVIkanmLNJdYk+X6X42MK
         T1bKB8p3c2YtJcTR23CnS1zrMukswXyIwz60myEf7Wc62ETmslb0tGh2ZFtSDdXZvNc5
         T0rQ==
X-Gm-Message-State: AFuF++n2f2+VaDwdfpndnzAODKHQnk4ENJNyu9acNPBrcTjyOLiA6oVE
	d21zB6qhX9JUgeBC3B4fRSDmvmjhV9pW/EtMcPdLlHjRoRbrabQmOmbSrLploppH7vUlZ5Zpbfy
	81hIJesSVkGR4iUSUdxS5UBd7GQXG5NcEQimdEdw=
X-Gm-Gg: AYBFou3R/zvRXQEYpYFH7QEbY7lZwjogDeVG4kspWX19B1TawlvDXs6wLBay2g8vof+
	vgxW8SDjSL/Y5jeW3c73FzfBmlSWjjOmciZenHEaBjwLkiz3c0ZI3CkXwI0tABm4FKoJe7EF10a
	pXbUK5J7vRtNlt9xx+bK/qBNOrxmww6/u/I7MFcQmRKXSoK/+KW4QIvDOVPmZV5FmHV8IAahI9v
	kFmLFbpXijMbeiwsYx0Gt7Kn7hhDUPHGJw7qegn1VHKwNY3FcheAW+7DK1ex596Z3nyzIXzgq4d
	gmCHqtZCuFVsv18iBdYq1w51M9jU/RnGeTlObHnpID/7zlMr/m6DTtGVrUS4v+8H2Vbp/0jFTrd
	ovK4Tj3TTSwnq/Fg=
X-Received: by 2002:a05:651c:a38f:10b0:3a3:7681:6d5d with SMTP id
 38308e7fff4ca-3a37681748cmr11742711fa.21.1788727942625; Sun, 06 Sep 2026
 13:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com>
 <20260906-perf-gtk2-v7-1-1ece839fbca0@gmail.com> <20260906202542.E548D1F00A3A@smtp.kernel.org>
In-Reply-To: <20260906202542.E548D1F00A3A@smtp.kernel.org>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 6 Sep 2026 16:52:10 -0400
X-Gm-Features: AcwNN1UluC9sCF1AfaoB_QDn5rUqNCsIttJ4OM-0bXZJ5LOVybQjVpfERdAc7tU
Message-ID: <CAEdQ38EqhLXyZiR5P-gXtQrrEjceamN8FEVXcYvrbVvqJmduZA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] tools: port perf ui from GTK 2 to GTK 4
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 4:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Connecting to the removed 'destroy' signal in GTK4 causes main=
 loop hangs and use-after-free/double-free bugs.
> --
>
> commit fc78f437c6f22aa072d608cee2f291c6178f6853
> Author: Matt Turner <mattst88@gmail.com>
>
>     tools: port perf ui from GTK 2 to GTK 4
>
>     Port straight to GTK 4 rather than GTK 3, since GTK 4 is where new
>     development happens and GTK 3 is old itself now.
>
> > diff --git a/tools/perf/ui/gtk/progress.c b/tools/perf/ui/gtk/progress.=
c
> > index eea6fcde518a8..770f9251b54b7 100644
> > --- a/tools/perf/ui/gtk/progress.c
> > +++ b/tools/perf/ui/gtk/progress.c
> > @@ -1,49 +1,65 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <inttypes.h>
> > +#include <stdio.h>
>
> [ ... ]
>
> > +static void gtk_ui_progress__destroyed(GtkWidget *widget __maybe_unuse=
d,
> > +                                     gpointer data __maybe_unused)
> > +{
> > +     dialog =3D NULL;
> > +     progress =3D NULL;
> > +}
> > +
> >  static void gtk_ui_progress__update(struct ui_progress *p)
> >  {
> >       double fraction =3D p->total ? 1.0 * p->curr / p->total : 0.0;
> >       char buf[1024];
> >
> >       if (dialog =3D=3D NULL) {
> > -             GtkWidget *vbox =3D gtk_vbox_new(TRUE, 5);
> > +             GtkWidget *vbox =3D gtk_box_new(GTK_ORIENTATION_VERTICAL,=
 5);
> >               GtkWidget *label =3D gtk_label_new(p->title);
> >
> > -             dialog =3D gtk_window_new(GTK_WINDOW_TOPLEVEL);
> > +             dialog =3D gtk_window_new();
> >               progress =3D gtk_progress_bar_new();
> >
> > -             gtk_box_pack_start(GTK_BOX(vbox), label, TRUE, FALSE, 3);
> > -             gtk_box_pack_start(GTK_BOX(vbox), progress, TRUE, TRUE, 3=
);
> > +             gtk_widget_set_vexpand(label, TRUE);
> > +             gtk_box_append(GTK_BOX(vbox), label);
> > +             gtk_widget_set_vexpand(progress, TRUE);
> > +             gtk_box_append(GTK_BOX(vbox), progress);
> > +
> > +             gtk_window_set_child(GTK_WINDOW(dialog), vbox);
> >
> > -             gtk_container_add(GTK_CONTAINER(dialog), vbox);
> > +             g_signal_connect(dialog, "destroy",
> > +                              G_CALLBACK(gtk_ui_progress__destroyed), =
NULL);
>
> [Severity: Medium]
> In gtk_ui_progress__update(), will this signal connection fail at runtime=
?
> The destroy signal was removed from GtkWidget in GTK 4. If it fails silen=
tly,
> gtk_ui_progress__destroyed() would not be called to nullify the pointer w=
hen
> the user manually closes the progress window. This could result in a
> use-after-free or double-free crash when gtk_ui_progress__finish() is
> subsequently called on the already-freed pointer.

Incorrect. GTK4 did not remove the destroy signal from GtkWidget, only
the gtk_widget_destroy() function was removed. The signal is still
registered in gtk/gtkwidget.c (g_signal_new(I_("destroy"), ...)) and
emitted from gtk_widget_dispose(). Verified against upstream GTK
source, and confirmed live via GObject.signal_list_names(Gtk.Widget)
on GTK 4.20.4: destroy is present. g_signal_connect(dialog, "destroy",
...) connects fine and fires. No change needed.

> [ ... ]
>
> > diff --git a/tools/perf/ui/gtk/util.c b/tools/perf/ui/gtk/util.c
> > index c47f5c387838c..5823ff0d7c2a7 100644
> > --- a/tools/perf/ui/gtk/util.c
> > +++ b/tools/perf/ui/gtk/util.c
> > @@ -28,86 +30,103 @@ int perf_gtk__deactivate_context(struct perf_gtk_c=
ontext **ctx)
>
> [ ... ]
>
> > +     /*
> > +      * "response" only fires when a button is clicked; DESTROY_WITH_P=
ARENT
> > +      * destroys the dialog directly without it. Quit from "destroy"
> > +      * instead, which fires either way, so the nested loop below can'=
t
> > +      * outlive the dialog and hang.
> > +      */
> > +     loop =3D g_main_loop_new(NULL, FALSE);
> > +     perf_gtk__error_loops =3D g_slist_prepend(perf_gtk__error_loops, =
loop);
> > +     g_signal_connect(dialog, "response",
> > +                      G_CALLBACK(perf_gtk__dialog_response), NULL);
> > +     g_signal_connect_swapped(dialog, "destroy",
> > +                              G_CALLBACK(g_main_loop_quit), loop);
>
> [Severity: Medium]
> In perf_gtk__error(), since the destroy signal no longer exists in GTK 4,
> could this leave the nested main loop running indefinitely and hanging th=
e
> application? Because the destroy signal is not emitted when the dialog is
> closed (even via the confirmation button), g_main_loop_quit() will never =
be
> called.

Also incorrect, same misunderstanding of the destroy signal. When the
user closes the dialog via the window controls, gtk_window_close()
calls gtk_window_emit_close_request(). The default close_request
handler returns FALSE (no hide_on_close set), so control falls through
to gtk_window_destroy(), which drops GTK's internal toplevel ref and
finalizes the widget, emitting destroy. That is exactly the signal
perf_gtk__error() connects to stop the nested loop. Confirmed by
reading gtk_window_close() and gtk_window_destroy() in gtkwindow.c,
and gtk_widget_dispose() in gtkwidget.c, in current GTK upstream. No
hang. No change needed.
